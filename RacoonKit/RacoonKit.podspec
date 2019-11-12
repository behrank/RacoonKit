Pod::Spec.new do |spec|
  spec.name         = "RacoonKit"
  spec.version      = "0.8.0"
  spec.summary      = "A lightwight UI framework => RacoonKit"
  spec.description  = "A lightwight UI framework written with using Swift."
  spec.homepage     = "https://github.com/behrank/RacoonKit"
  spec.license      = "MIT"
  spec.author             = { "Behran Kankul" => "behrank@gmail.com" }
  spec.social_media_url   = "https://twitter.com/Behrann"
  spec.platform     = :ios, "10.0"
  spec.swift_version = '4.0'
  spec.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
  spec.ios.deployment_target = '10.0'
  spec.source       = { :git => "https://github.com/behrank/RacoonKit.git", :tag => "0.8.0" }
  spec.source_files  = "RacoonKit/**/*"
  spec.exclude_files = "RacoonKit/**/*.plist"
  spec.framework  = "UIKit"
  spec.pod_target_xcconfig = {"PRODUCT_BUNDLE_IDENTIFIER" => "com.bemobile.RacoonKit" ,"DEVELOPMENT_TEAM" => "Can Behran Kankul"}
  spec.info_plist = {
  'CFBundleIdentifier' => 'com.bemobile.RacoonKit'
}
end
