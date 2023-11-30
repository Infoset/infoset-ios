Pod::Spec.new do |s|
  s.name                = 'Infoset'
  s.version             = '1.6.1'
  s.summary             = 'The Infoset iOS SDK, for integrating Infoset products into your iOS application.'
  s.license             = { :type => "./LICENSE", :file => 'LICENSE' }
  s.authors             = { 'Samed Düzçay' => 'samed@infoset.app', 'Onur Coşkun' => 'onur@infoset.app' }
  s.homepage            = 'https://github.com/infoset/infoset-ios'
  s.description         = 'The Infoset iOS SDK allows you to integrate Infoset products such as live chat and omnichannel support management to your iOS app.'
  s.frameworks          = ['UIKit', 'WebKit', 'Foundation', 'Photos', 'ImageIO', 'MobileCoreServices']
  s.requires_arc        = true
  s.source              = { :git => 'https://github.com/infoset/infoset-ios.git', :tag => s.version.to_s }
  s.platform            = :ios, '12.0'
  s.preserve_paths      = 'Infoset.xcframework'
  s.vendored_frameworks = 'Infoset.xcframework'
end
