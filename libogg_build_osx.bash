IDZ_OGG_VERSION=1.3.2

#Automatically set the current sdk version for ios
IDZ_OGG_SDK_VERSION=`xcrun --sdk macosx --show-sdk-version`

pushd $IDZ_BUILD_ROOT
mkdir -p libogg/$IDZ_OGG_VERSION
pushd libogg/$IDZ_OGG_VERSION
IDZ_OGG_DIR=libogg-$IDZ_OGG_VERSION
svn co http://svn.xiph.org/tags/ogg/$IDZ_OGG_DIR
pushd $IDZ_OGG_DIR
./autogen.sh
make distclean
popd
idz_configure x86_64_osx $IDZ_OGG_SDK_VERSION $IDZ_OGG_DIR/configure
idz_configure arm64_osx $IDZ_OGG_SDK_VERSION $IDZ_OGG_DIR/configure
idz_fw Ogg libogg.a install-MacOSX-x86_64/include/ogg "x86_64_osx arm64_osx"
echo "Wrote `pwd`/Ogg.framework"
popd
popd
