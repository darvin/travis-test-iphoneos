#!/bin/sh
pushd .travis/
tar xvf secrets.tar
security create-keychain -p travis ios-build.keychain
wget https://developer.apple.com/certificationauthority/AppleWWDRCA.cer
security import AppleWWDRCA.cer  -k  ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
security import certificate.cer  -k  ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
security import certificate.p12  -k  ~/Library/Keychains/ios-build.keychain  -P $KEY_PASSWORD -T /usr/bin/codesign
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp profile.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/
