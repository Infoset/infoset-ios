Pod::Spec.new do |s|
  s.name             = 'Infoset'
  s.version          = '1.0.0'
  s.summary          = 'Infoset iOS SDK, for integrating Infoset products such as live chat and tickets to your iOS app.'
  s.authors           = { 'Samed Düzçay' => 'samed@infoset.app' }
  s.license          = { :type => "./LICENSE", :file => 'LICENSE' }
  s.homepage         = 'https://github.com/infoset/infoset-ios'
  s.source              = { :http => "https://github.com/infoset/infoset-ios/releases/download/#{s.version}/CocoaPods.tar.gz" }

  s.platform            = :ios, '10.0'
  s.ios.deployment_target = '10.0'
  s.preserve_paths      = 'Infoset.framework'
  s.public_header_files = 'Infoset.framework/Headers/Infoset.h', 'Infoset.framework/Headers/Infoset-Swift.h'
  s.source_files        = 'Infoset.framework/Headers/Infoset.h', 'Infoset.framework/Headers/Infoset-Swift.h'
  s.vendored_frameworks = 'Infoset.framework'
  s.frameworks = 'UIKit', 'WebKit', 'Foundation'
  s.swift_version = '5.0'
end
