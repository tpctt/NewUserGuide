Pod::Spec.new do |s|
  s.name                  = "NewUserGuide"
  s.version               = "1.0.0"
  s.summary               = "初始化一个 聚光灯效果, 用于功能引导, 支持 path 和 view 的设置,包括一张图片"
  s.homepage              = "https://github.com/tpctt/NewUserGuide"
  s.social_media_url      = "https://github.com/tpctt/NewUserGuide"
  s.platform     = :ios,'6.0'
  s.license               = { :type => "MIT", :file => "LICENSE" }
  s.author                = { " tim" => "491590253@qq.com" }
  s.source                = { :git => "https://github.com/tpctt/NewUserGuide.git",:tag => s.version.to_s 
    #:commit => "cebd0fe6d6a0e087cf7d5ed86a572d31f9e8af14" 
    }
  s.source_files = 'Classess/**/*.{h,m,mm}'
  #s.resources   = "YMCitySelect/*.{png,bundle}"

  s.ios.deployment_target = "6.0"
  s.requires_arc          = true
  s.framework             = "CoreFoundation","Foundation","CoreGraphics","UIKit"
  # s.library		= "z.1.1.3","stdc++","sqlite3"
 
  #s.subspec 'HYBPhotoPickerManager' do |sp|
  #sp.source_files = 'YMCitySelect/*.{h,m,mm}'
  #  sp.resources   = "Extend/**/*.{png}"
    # sp.requires_arc = true
    # sp.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libz, $(SDKROOT)/usr/include/libxml2', 'CLANG_CXX_LANGUAGE_STANDARD' =>  #'gnu++0x', 'CLANG_CXX_LIBRARY' => 'libstdc++', 'CLANG_WARN_DIRECT_OBJC_ISA_USAGE' => 'YES'}
   
  #  sp.dependency 'FontIcon'
   # sp.prefix_header_contents = '#import "EasyIOS.h"'
#  end
end
