Pod::Spec.new do |s|
  s.name             = 'HXCrashProtection'
  s.version          = '0.0.1'
  s.summary          = '基础防护常用系统类使用崩溃'

  s.homepage         = 'https://github.com/yiyucanglang'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dahuanxiong' => 'xinlixuezyj@163.com' }
  s.source           = { :git => 'https://github.com/yiyucanglang/HXCrashProtection.git', :tag => s.version.to_s }
  s.static_framework = true
  s.ios.deployment_target = '8.0'
  s.public_header_files = '*{h}','Container/*{h}','NSNotification/*{h}','NSNull/*{h}','NSTimer/*{h}','String/*{h}'
  s.source_files = '*.{h,m}','Container/*.{h,m}','NSNotification/*.{h,m}','NSNull/*.{h,m}','NSTimer/*.{h,m}','String/*.{h,m}'
  
  s.dependency 'RSSwizzle'
 end
