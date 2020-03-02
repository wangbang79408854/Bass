#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint bass.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'bass'
  s.version          = '0.0.1'
  s.summary          = 'A new bass plugin.'
  s.description      = <<-DESC
A new bass plugin.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'
  s.vendored_libraries = 'libs/*.a'
  s.frameworks = 'AudioToolbox','SystemConfiguration','Accelerate','CFNetwork'
  
  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
end
