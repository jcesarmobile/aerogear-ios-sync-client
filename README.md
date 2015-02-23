# AeroGear iOS Differential Synchronization Client [![Build Status](https://travis-ci.org/aerogear/aerogear-ios-sync-client.png)](https://travis-ci.org/aerogear/aerogear-ios-sync-client) [![Pod Version](http://img.shields.io/cocoapods/v/AeroGearSyncClient.svg?style=flat)](http://cocoadocs.org/docsets/AeroGearSyncClient/)

> This module is beta software, it currently supports Xcode 6.1.1

This project represents a client side implementation for [AeroGear Differential 
Synchronization (DS) Server](https://github.com/danbev/aerogear-sync-server/tree/differential-synchronization).

This client uses the communication with the backend server implementation. The [iOS SyncEngine](https://github.com/danbev/aerogear-ios-sync)
performs the actual work of the DiffSync protocol, please refer to it's README.md for more details.

## Prerequisites 

This project used [CocoaPods](http://cocoapods.org/) to managed its dependencies. The following command 
must be run prior to building:
    
    sudo gem install cocoapods --pre
    pod install

## Building

Building can be done by opening the project in Xcode:

    open AeroGearSyncClient.xcworkspace

or you can use the command line:

    xcodebuild -workspace AeroGearSyncClient.xcworkspace/ -scheme AeroGearSyncClient -sdk iphonesimulator ONLY_ACTIVE_ARCH=NO

## Testing
Tests can be run from with in Xcode using Product->Test menu option (CMD+U).  
You can also run test from the command:

    xcodebuild -workspace AeroGearSyncClient.xcworkspace/ -scheme AeroGearSyncClient -sdk iphonesimulator ONLY_ACTIVE_ARCH=NO test

_Note_ At the moment the test require that the [AeroGear Differential Synchronization (DS) Server](https://github.com/danbev/aerogear-sync-server/tree/differential-synchronization).
is running. If it is not en error message simliar to this will be displayed:
```shell
aerogear-ios-sync-client/AeroGearSyncClientTests/SyncClientTests.swift:44: error: -[AeroGearSyncClientTests.SyncClientTests testDiffAndSync] : Asynchronous wait failed: Exceeded timeout of 3 seconds, with unfulfilled expectations: "Callback should be invoked. Is the Sync Server running?".
```

### [CocoaPods](http://cocoapods.org/) 
At this time, Cocoapods support for Swift frameworks is supported in a [pre-release](http://blog.cocoapods.org/Pod-Authors-Guide-to-CocoaPods-Frameworks/).

To use AeroGearSyncClient in your project add the following 'Podfile' to your project

    source 'https://github.com/CocoaPods/Specs.git'

    xcodeproj 'YourProjectName.xcodeproj'
    platform :ios, '8.0'

    pod 'AeroGearSyncClient', :git => "https://github.com/aerogear/aerogear-ios-sync-client.git", :branch => "master"

    target 'YourProjectNameTests' do
        pod 'AeroGearSyncClient', :git => "https://github.com/aerogear/aerogear-ios-sync-client.git", :branch => "master"
    end
    
Then run:

    pod install

#### Updating the Cocoapod
You can validate AeroGearSyncClient.podspec using:

    pod spec lint AeroGearSyncClient.podspec  --verbose --allow-warnings

This should be tested with a sample project before releasing it. This can be done by adding the following line to a ```Podfile```:
    
    pod 'AeroGearSyncClient', :git => "https://github.com/username/aerogear-ios-sync-client.git", :branch => "cocoapods-update"

Then run:
    
    pod install

If all goes well you are ready to release. First, create a tag and push:

    git tag -s 'version'
    git push --tags

Once the tag is available you can send the library to the Specs repo. 
For this you'll have to follow the instructions in [Getting Setup with Trunk](http://guides.cocoapods.org/making/getting-setup-with-trunk.html).

    pod trunk push AeroGearSyncClient.podspec



