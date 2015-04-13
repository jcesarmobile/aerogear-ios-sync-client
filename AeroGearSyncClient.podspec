Pod::Spec.new do |s|
  s.name         = "AeroGearSyncClient"
  s.version      = "0.1.0"
  s.summary      = "An iOS Sync Client for AeroGear Differential Synchronization"
  s.homepage     = "https://github.com/aerogear/aerogear-sync-server"
  s.license      = 'Apache License, Version 2.0'
  s.author       = "Red Hat, Inc."
  s.source       = {:git => 'https://github.com/aerogear/aerogear-ios-sync-client.git', :branch => 'master'}
  s.platform     = :ios, 8.0
  s.requires_arc = 'true'
  s.source_files = 'AeroGearSyncClient/*.{h,swift}'
  s.dependency  'AeroGearSync/Core'
  s.dependency  'Starscream', '0.9.3'
end
