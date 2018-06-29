@version = “0.0.1”
Pod::Spec.new do |s| 
s.name = “podTest” 
s.version = @version 
s.summary = “第一次项目” 
s.description = “RAC 使用技巧和测试代码用” 
s.homepage = “https://github.com/AppleP1999/ReactiveCocoaTest” 
s.license = { :type => ‘MIT’, :file => ‘LICENSE’ } 
s.author = { ReactiveCocoaTest” => 18224013914@163.com” } 
s.ios.deployment_target = ‘8.0’ 
s.source = { :git => “https://github.com/Pangshishan/PSSTableViewNoneData.git“, :tag => “v#{s.version}” } 
s.source_files = podTest/Code/*/.{h,m}’ 
s.requires_arc = true 
s.framework = “UIKit” 
end