# Install Binaries for iOS

1. Copy the **OPGSDKHeaders** to your Xcode project

2. Copy **libOPGSDK.a** to your Xcode project

3. Add the following flags to "Other Linker Flags" in your target build settings:
   `-ObjC -lz` 

4. Add the following flag to "Header Search Path" in your targer build settings:
    `$SOURCE_ROOT\include` and also check the dropdown to recursive.

5. Add the **libiconv.tbd**, **libz.tbd**, **libc++.tbd**, **libsqlite3.tbd** frameworks to the project.
