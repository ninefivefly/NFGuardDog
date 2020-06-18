#
# Be sure to run `pod lib lint NFGuardDog.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NFGuardDog'
  s.version          = '1.0.0'
  s.summary          = 'APP的看门狗，主要功能有crash防护，crash收集，日志收集，FPS监控，流量监控'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        APP的看门狗，主要功能有crash防护，crash收集，日志收集，FPS监控，流量监控
                       DESC

  s.homepage         = 'https://github.com/JIANG PENGH CHENG/NFGuardDog'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'JIANG PENGH CHENG' => 'ninefivefly@foxmail.com' }
  s.source           = { :git => 'https://github.com/JIANG PENGH CHENG/NFGuardDog.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'NFGuardDog/Classes/**/*'
  
  # s.resource_bundles = {
  #   'NFGuardDog' => ['NFGuardDog/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
