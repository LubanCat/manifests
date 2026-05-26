#!/bin/bash
set -eE

# ============================================================
# CI Build Script for Rockchip RK3506 SDK Build and Pack
# ============================================================

CHIP="rk3506"
DEFCONFIGS=(
    "LubanCat_rk3506b_buildroot_emmc_linux_defconfig"
    "LubanCat_rk3506g_buildroot_nand_linux_tb_defconfig"
)

# ---- directory setup ----
SDK_DIR="${CI_PROJECT_DIR}/rk3506_sdk"
CCACHE_DIR="${CCACHE_DIR:-/var/cache/rk-ci/ccache}"
BR2_DL_DIR="${BR2_DL_DIR:-/var/cache/rk-ci/buildroot-dl}"
MANIFEST_FILE="${MANIFEST_XML:-rk3506_linux_release.xml}"

# NAS output path
NAS_PATH="${NAS_RK3506_URL}"
if [ -z "$NAS_PATH" ]; then
    echo "ERROR: NAS_RK3506_URL variable is not set. Please set it in GitLab CI/CD Variables."
    exit 1
fi
NAS_OUTDIR="${NAS_PATH}/$(date +%Y%m%d)"

export CCACHE_DIR
export USE_CCACHE=1

# ---- error handler ----
err_handler() {
    echo "ERROR: Build failed at line ${BASH_LINENO[0]} in ${BASH_SOURCE[1]}"
    echo "ERROR: Command: ${BASH_COMMAND}"
    exit 1
}
trap err_handler ERR

# ---- step 1: repo init / sync ----
echo "=========================================="
echo "  Step 1: repo init / sync"
echo "=========================================="

REPO_URL="${REPO_MIRROR_URL:-file:///var/cache/rk-ci/git-repo.git}"
MANIFEST_URL="git@gitlab.ebf.local:rockchip/linux/manifests.git"

# Clean up leftover from interrupted builds
rm -rf "$SDK_DIR"

mkdir -p "$SDK_DIR" "$NAS_OUTDIR"
cd "$SDK_DIR"

echo "repo init (branch: ${CI_COMMIT_BRANCH}, manifest: ${MANIFEST_FILE})..."
echo N | repo init -u "$MANIFEST_URL" \
    -b "${CI_COMMIT_BRANCH}" \
    -m "$MANIFEST_FILE" \
    --repo-url="$REPO_URL" \
    --no-repo-verify

echo "repo sync ..."
.repo/repo/repo sync -c -j$(nproc)

# Verify SDK layout
if [ ! -f "$SDK_DIR/device/rockchip/common/build.sh" ]; then
    echo "ERROR: SDK layout invalid - device/rockchip/common/build.sh not found"
    exit 1
fi

# ---- step 2: pack SDK source ----
echo ""
echo "=========================================="
echo "  Step 2: Pack SDK source"
echo "=========================================="

if [ "${SDK_PACK}" = "true" ] || [ "${SDK_PACK}" = "1" ]; then
    SDK_ARCHIVE="$NAS_OUTDIR/sdk-source_$(date +%Y%m%d).tar.gz"
    echo "Packing SDK source (excluding .repo/ and output/)..."
    tar czf "$SDK_ARCHIVE" \
        --exclude='.repo' \
        -C "$SDK_DIR" .
    echo "SDK source archive: $SDK_ARCHIVE"
    ls -lh "$SDK_ARCHIVE"
else
    echo "PACK SDK source, skipping."
fi

# ---- step 3: setup caches ----
echo ""
echo "=========================================="
echo "  Step 3: Setup caches dir"
echo "=========================================="

mkdir -p "$CCACHE_DIR"
ccache -z
echo "ccache stats before build:"
ccache -s

# ---- step 4: sequential builds ----
echo "=========================================="
echo "  Step 4: Building ${#DEFCONFIGS[@]} defconfigs"
echo "=========================================="

for i in "${!DEFCONFIGS[@]}"; do
    DEFCONFIG="${DEFCONFIGS[$i]}"
    BUILD_NUM=$((i + 1))
    BUILD_COUNT=${#DEFCONFIGS[@]}

    echo ""
    echo "####################################################"
    echo "  Build ${BUILD_NUM}/${BUILD_COUNT}: ${DEFCONFIG}"
    echo "####################################################"

    cd "$SDK_DIR"

    # build
    echo "--- Running build: ./build.sh chip:${CHIP}:${DEFCONFIG} all ---"
    </dev/null ./build.sh "chip:${CHIP}:${DEFCONFIG}"
    </dev/null ./build.sh all

    # Verify output
    UPDATE_IMG="$SDK_DIR/output/firmware/update.img"
    if [ ! -f "$UPDATE_IMG" ]; then
        echo "ERROR: update.img not generated for $DEFCONFIG"
        exit 1
    fi

    # Compress, checksum, and save to NAS
    BASE_NAME="${DEFCONFIG%_defconfig}_$(date +%Y%m%d)_update"

    echo "--- Compressing $BASE_NAME.img ---"
    gzip -c "$UPDATE_IMG" > "$NAS_OUTDIR/${BASE_NAME}.img.gz"

    echo "--- Generating MD5 ---"
    cd "$NAS_OUTDIR"
    md5sum "${BASE_NAME}.img.gz" > "${BASE_NAME}.img.gz.md5"
    cd "$SDK_DIR"

    echo "Saved to NAS:"
    ls -lh "$NAS_OUTDIR/${BASE_NAME}.img.gz" \
           "$NAS_OUTDIR/${BASE_NAME}.img.gz.md5"

    echo "--- Build ${BUILD_NUM}/${BUILD_COUNT} complete: ${BASE_NAME} ---"
done

echo "ccache stats after build:"
ccache -s

# ---- step 5: cleanup SDK_DIR ----
echo ""
echo "=========================================="
echo "  Step 5: Cleanup SDK source"
echo "=========================================="
cd "$CI_PROJECT_DIR"
echo "Removing SDK_DIR: $SDK_DIR"
rm -rf "$SDK_DIR"
echo "Cleanup done."

echo ""
echo "All builds complete."
