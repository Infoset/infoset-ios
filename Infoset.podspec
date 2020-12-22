Pod::Spec.new do |s|
  s.name             = 'Infoset'
  s.version          = '1.0.4'
  s.summary          = 'Infoset iOS SDK, for integrating Infoset products such as live chat and tickets to your iOS app.'
  s.authors          = { 'Samed Düzçay' => 'samed@infoset.app' }
  s.license          = { :type => "./LICENSE", :file => 'LICENSE' }
  s.homepage         = 'https://github.com/infoset/infoset-ios'
  s.source           = { :git => 'https://github.com/infoset/infoset-ios.git', :tag => s.version.to_s }

  s.platform              = :ios, '10.0'
  s.ios.deployment_target = '10.0'
  s.preserve_paths        = 'Infoset.xcframework'
  s.vendored_frameworks   = 'Infoset.xcframework'
  s.frameworks            = 'UIKit', 'WebKit', 'Foundation'
  s.swift_version         = '5.0'
  s.requires_arc          = true
end
