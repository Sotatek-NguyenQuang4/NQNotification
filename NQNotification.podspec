#
# Be sure to run `pod lib lint NQNotification.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NQNotification'
  s.version          = '0.1.0'
  s.summary          = 'A short description of NQNotification.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/quang.nguyen/NQNotification'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'quang.nguyen' => 'quang.nguyen4@sotatek.com' }
  s.source           = { :git => 'https://github.com/quang.nguyen/NQNotification.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'NQNotification/Classes/**/*'
  
  # s.resource_bundles = {
  #   'NQNotification' => ['NQNotification/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'Firebase/Analytics'
   s.dependency 'Firebase/Messaging'
   s.dependency 'Firebase/Core'
   s.dependency 'Firebase/Auth'
end
