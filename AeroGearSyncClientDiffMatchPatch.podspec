Pod::Spec.new do |s|
  s.name         = "AeroGearSyncClientDiffMatchPatch"
  s.version      = "1.0.0-alpha.3"
  s.summary      = "An iOS Sync Client for AeroGear Differential Synchronization"
    s.description  = <<-DESC
  AeroGearSyncClient is using the synchronisation engine based on Google Diff Match Patch algorithm.
  This Client is based on WebSocket implementation. 
                   DESC
  s.homepage     = "https://github.com/aerogear/aerogear-sync-server"
  s.license      = 'Apache License, Version 2.0'
  s.author       = "Red Hat, Inc."
  s.source       = {:git => 'https://github.com/aerogear/aerogear-ios-sync-client.git', :tag => s.version }
  s.platform     = :ios, 8.0
  s.requires_arc = 'true'
  s.source_files = 'AeroGearSyncClient/SyncClientDiffMatchPatch.swift'
  s.dependency  'AeroGearSyncDiffMatchPatch', '1.0.0-alpha.3'
  s.dependency  'Starscream'
end
