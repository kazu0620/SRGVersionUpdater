Pod::Spec.new do |s|
  s.name         = "SRGVersionUpdater"
  s.version      = "0.0.1"
  s.summary      = "SRGVersionUpdater inform users about new app version release, and can force users update app to version. "
  s.homepage     = "https://github.com/kazu0620/SRGVersionUpdater"
  s.license      = "MIT"
  s.author       = { "Kazuhiro Sakamoto" => "kazu620@gmail.com" }
  s.source       = { :git => "https://github.com/kazu0620/SRGVersionUpdater.git", :tag => "0.0.1" }
  s.platform     = :ios, '6.0'
  s.source_files = "Classes", "Classes/**/*.{h,m}"
  s.resources    = 'SRGVersionUpdater.bundle'
  s.requires_arc = true

  s.dependency 'BlocksKit' , '2.2.5'
  s.dependency 'AFNetworking', '2.3.1'
end
