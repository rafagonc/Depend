#
# Be sure to run `pod lib lint Depend.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Depend"
  s.version          = "0.1.4"
  s.summary          = "minimalist depedency injection framework"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = "Depend is a simple dependency injection framework to do the simplest and minimally invasive property injection. It just works with Protocol bindings since it is the right way to do it!"

  s.homepage         = "https://github.com/rafagonc/Depend"
  s.license          = 'MIT'
  s.author           = { "Rafael Gonçalves" => "rafagonc77@yahoo.com.br" }
  s.source           = { :git => "https://github.com/rafagonc/Depend.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/core_rafa'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
#  s.resource_bundles = {
#    'Depend' => ['Pod/Assets/*.png']
#  }

  s.public_header_files = 'Pod/Classes/DPRegistry.h', 'Pod/Classes/DPInjector.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
