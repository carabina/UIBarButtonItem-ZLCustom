Pod::Spec.new do |s|

    s.name                  = "UIBarButtonItem+ZLCustom"

    s.version               = "0.0.1"

    s.summary               = "快速创建UIBarButtonItem对象"

    s.description           = "快速创建UIBarButtonItem对象。轻量级、无污染"

    s.homepage              = "https://github.com/ZLDemo/UIBarButtonItem-ZLCustom"

    s.license               = "MIT"

    s.author                = { "Mr.Zhao" => "itzhaolei@foxmail.com" }

    s.source                = { :git => "https://github.com/ZLDemo/UIBarButtonItem-ZLCustom.git", :tag => "0.0.1" }

    s.framework             = "UIKit"

    s.ios.deployment_target = '8.0'

    s.source_files          = "UIBarButtonItem-ZLCustom/UIBarButtonItem+ZLCustom/*.{h,m}"

    s.exclude_files         = ""

end