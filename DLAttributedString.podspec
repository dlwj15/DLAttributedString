Pod::Spec.new do |s|



  s.name         = "DLAttributedString"
  s.version      = "0.0.1"
  s.summary      = "链式开发富文本"
  # s.description  = <<-DESC
  #                  DESC

  s.homepage     = "https://github.com/dlwj15/DLAttributedString"
  s.source       = { :git => "https://github.com/dlwj15/DLAttributedString.git", :tag => "v0.0.1" } #:tag => "1.6.2" tag => "#{s.version}"
  s.source_files = "DLAttributedString/*"
  s.license      = "MIT"

  s.author             = { "wenjie" => "749157765@qq.com" }
  s.requires_arc = true # 是否启用ARC
  s.platform     = :ios, "8.0" #平台及支持的最低版本
  s.frameworks   = "UIKit", "Foundation" #支持的框架
  



  # s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

  
end
