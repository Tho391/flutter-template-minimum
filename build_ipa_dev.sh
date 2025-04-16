#!/bin/bash

# Step 1: Set environment variables
WORKSPACE="$PWD/ios/Runner.xcworkspace"
SCHEME="dev"  # Change this to the appropriate scheme (e.g., Runner-dev, Runner-prod)
CONFIGURATION="Release-dev"
IPA_OUTPUT_PATH="$PWD/build/ios/ipa"
EXPORT_OPTIONS_PLIST="$PWD/ios/ExportOptions.plist"  # Ensure this path is correct
FLAVOR="dev"  # Change this to the flavor you need (e.g., dev, prod)
DART_DEFINE="FLAVOR=dev"  # Dart define for flavor

# Step 3: Build the iOS app with Flutter (without code signing)
echo "Building the iOS app for the $FLAVOR flavor..."
fvm flutter build ios --release --flavor $FLAVOR --dart-define=$DART_DEFINE --no-codesign
if [ $? -eq 0 ]; then
    echo "iOS app built successfully!"
else
    echo "iOS build failed!"
    exit 1
fi

# Step 4: Create an archive (.xcarchive)
echo "Creating the iOS archive..."
xcodebuild \
    -workspace "$WORKSPACE" \
    -scheme "$SCHEME" \
    -configuration "$CONFIGURATION" \
    -archivePath "$IPA_OUTPUT_PATH/Runner.xcarchive" \
    archive \
    -allowProvisioningUpdates
if [ $? -eq 0 ]; then
    echo "iOS archive created successfully!"
else
    echo "iOS archiving failed!"
    exit 1
fi

# Step 5: Export the archive to an IPA file
echo "Exporting the IPA file..."
xcodebuild \
    -exportArchive \
    -archivePath "$IPA_OUTPUT_PATH/Runner.xcarchive" \
    -exportPath "$IPA_OUTPUT_PATH" \
    -exportOptionsPlist "$EXPORT_OPTIONS_PLIST" \
    -allowProvisioningUpdates
if [ $? -eq 0 ]; then
    echo "IPA file exported successfully!"
else
    echo "IPA export failed!"
    exit 1
fi

# Step 6: Verify if the IPA file is created
if [ ! -f "$IPA_OUTPUT_PATH/Vehicle Health.ipa" ]; then
    echo "Error: IPA file not created!"
    exit 1
else
    echo "IPA file is ready and saved at: $IPA_OUTPUT_PATH/Vehicle Health.ipa"
fi