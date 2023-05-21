
Pod::Spec.new do |s|
  s.name             = 'RKCooperationCore'
  s.version          = '4.5.0_beta1'
  s.summary          = 'iOS Rokid meeting core .'
  s.description      = <<-DESC
  Rokid iOS Core SDK .
                       DESC

  s.homepage         = 'https://github.com/RokidiOS/RKCooperationCore'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'amos' => 'xiaodong.chen@rokid.com' }
  s.source = { :git => "https://github.com/RokidiOS/RKCooperationCore.git", :branch => "4.5.0_beta1" }

  s.ios.deployment_target = '10.0'
  
  s.swift_version = '5.0'
  
  s.ios.vendored_frameworks = "Frameworks/*.framework"
  
  s.xcconfig = {
    'ENABLE_BITCODE' => 'NO'
  }
  
  s.dependency 'RKILogger'
  
  s.dependency 'RKIUtils'
  
  s.dependency 'RKIHandyJSON'

  s.dependency 'RKRTC' :git => "https://github.com/RokidiOS/RKRTC", :branch => '4.5.0_beta1'

  s.dependency 'Moya'

  end
