#!/bin/sh
#
cd HelloWorld
pwd

#
buildDay=$(date +%Y%m%d)
buildTime=$(date +%Y%m%d%H%M)
workspace=HelloWorld.xcworkspace
scheme=HelloWorld
APPNAME=HelloWorld

profile="DPTest.mobileprovision"

#
buildConfiguration="Release"
buildPath="../${buildDay}/Auto_Release_${buildTime}.xcarchive"
ipaName="../ipa/QA/${buildDay}/Auto_Release_${buildTime}.ipa"

#
xctool -workspace $workspace -scheme $scheme -sdk iphoneos -configuration $buildConfiguration OBJROOT=$PWD/build SYMROOT=$PWD/build ONLY_ACTIVE_ARCH=NO

OUTPUTDIR="$PWD/build/Release-iphoneos"
PROVISIONING_PROFILE="$PWD/../DPTest.mobileprovision"
CODE_SIGN_RESOURCE_RULES_PATH=$(SDKROOT)/ResourceRules.plist
CODE_SIGN_IDENTITY="iPhone Developer: Dapeng Fu"
CODE_SIGN_IDENTITY[sdk=iphoneos*]="iPhone Developer: Dapeng Fu"
PROVISIONING_PROFIEL[sdk=iphoneos*]=$PROVISIONING_PROFILE

xcrun -log -sdk iphoneos PackageApplication -v "$OUTPUTDIR/$APPNAME.app" -o "$OUTPUTDIR/$APPNAME.ipa" -embed "$PROVISIONING_PROFILE"
