#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint talkie.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'talkie'
  s.version          = '0.0.1'
  s.summary          = 'flutter talkie codec'
  s.description      = <<-DESC
flutter talkie codec
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  # 添加 C 语言静态库
  s.ios.vendored_libraries = 'lib/talkie.a'
  s.source_files = 'Classes/**/*.{h,m,mm}'

  # 确保头文件可被 Objective-C/Swift 代码找到
  # Classes/**/*.h 确保插件本身的头文件可找到
  # lib/**/*.h 确保 C 库的头文件可找到
  s.public_header_files = 'Classes/**/*.h', 'lib/**/*.h'

  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.swift_version = '5.0'
end
