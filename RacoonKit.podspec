#
# Be sure to run `pod lib lint RacoonKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RacoonKit'
  s.version          = '1.0.0'
  s.summary          = 'A lightwight UI framework => RacoonKit'
  s.description      = "A lightwight UI framework written with using Swift."
  s.homepage         = 'https://github.com/behrank/RacoonKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'behrank' => 'behrank@gmail.com' }
  s.source           = { :git => 'https://github.com/behrank/RacoonKit.git', :tag => s.version.to_s }
  s.swift_version    = '4.0'
  s.ios.deployment_target = '10.0'
  s.source_files = 'Source/**/*.swift'
  s.frameworks = 'UIKit'
end
