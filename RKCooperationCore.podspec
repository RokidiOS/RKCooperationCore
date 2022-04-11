
Pod::Spec.new do |s|
  s.name             = 'RKCooperationCore'
  s.version          = '1.0.6'
  s.summary          = 'A short description of RKCooperationCore.'
  s.description      = <<-DESC
  Rokid iOS Core SDK .
                       DESC

  s.homepage         = 'https://github.com/RokidiOS/RKCooperationCore'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'amos' => 'xiaodong.chen@rokid.com' }
  s.source = { :git => "git@github.com:RokidiOS/RKCooperationCore.git", :branch => "1.0.6_swift5.5.2" }

  s.ios.deployment_target = '10.0'
  
  s.swift_version = '5.0'
  
#   s.source_files = 'RKCooperationCore/Classes/**/*'
  s.ios.vendored_frameworks = "Frameworks/*.framework"
  
  s.dependency 'RKILogger'
  s.dependency 'RKIUtils'
  s.dependency 'RKIHandyJSON'
  s.dependency 'Moya'
  s.dependency 'RKRTC'

  end
