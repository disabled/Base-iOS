scheme='Base-Package'
platform='iOS Simulator,name=iPhone 11,OS=14.3'

build:
	xcodebuild \
	-scheme $(scheme) \
	-sdk iphoneos \
	-configuration Release \
	-derivedDataPath '.build' | xcpretty 

test:
	xcodebuild \
	-derivedDataPath ".build" \
	-scheme $(scheme) \
	-destination platform=$(platform) \
	test

test_certain:
	xcodebuild \
	-derivedDataPath ".build" \
	-scheme $(scheme) \
	-destination platform=$(platform) \
	-only-testing:$(TEST) \
	test

xcode:
	swift package generate-xcodeproj

.PHONY: build test xcode
