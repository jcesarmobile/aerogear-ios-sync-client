Pod::Spec.new do |s|
  s.name         = "AeroGearSyncClient"
  s.version      = "1.0.0-alpha.2"
  s.summary      = "An iOS Sync Client for AeroGear Differential Synchronization"
  s.homepage     = "https://github.com/aerogear/aerogear-sync-server"
  s.license      = 'Apache License, Version 2.0'
  s.author       = "Red Hat, Inc."
  s.source       = {:git => 'https://github.com/aerogear/aerogear-ios-sync-client.git', :tag => s.version }
  s.platform     = :ios, 8.0
  s.requires_arc = 'true'
  s.source_files = 'AeroGearSyncClient/*.{h,swift}'
  s.dependency  'AeroGearSync/Core', '1.0.0-alpha.2'
  s.dependency  'Starscream', '0.9.3'
end
