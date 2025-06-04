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
  s.static_framework = true # 如果你的插件是给 Flutter 用的，建议加上
  s.ios.vendored_libraries = 'Classes/libs/libtalkie.a'

  s.source_files = 'Classes/**/*.{h,m,mm,cpp,c}'
  s.public_header_files = [
    'Classes/**/*.h',
    'Classes/libs/*.h'
  ]

  s.libraries = 'c++'

  # 配置搜索路径
  s.pod_target_xcconfig = {
    'HEADER_SEARCH_PATHS'  => '$(PODS_TARGET_SRCROOT)/Classes/libs $(PODS_TARGET_SRCROOT)/Classes',
    'LIBRARY_SEARCH_PATHS' => '$(PODS_TARGET_SRCROOT)/Classes/libs',
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++17',
    'CLANG_CXX_LIBRARY' => 'libc++'
  }

  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.swift_version = '5.0'
end
