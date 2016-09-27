source 'https://github.com/CocoaPods/Specs.git'

project 'AeroGearSyncClientJsonPatch.xcodeproj'
platform :ios, '8.0'
use_frameworks!

target 'AeroGearSyncClientJsonPatch' do
	pod 'Starscream', :git => 'https://github.com/jcesarmobile/Starscream', :branch => 'swift-23'
	pod 'AeroGearSyncJsonPatch', :git => 'https://github.com/aerogear/aerogear-ios-sync'
end

# Workaround to fix swift version to 2.3 for Pods.
# it could be removed once CocoaPods 1.1.0 is released.
# https://github.com/CocoaPods/CocoaPods/issues/5521
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '2.3'
    end
  end
end