
Pod::Spec.new do |s|
  s.name             = 'RKCooperationCore'
  s.version          = '1.0.5'
  s.summary          = 'iOS Rokid meeting core .'
  s.description      = <<-DESC
  Rokid iOS Core SDK .
                       DESC

  s.homepage         = 'https://github.com/RokidiOS/RKCooperationCore'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'amos' => 'xiaodong.chen@rokid.com' }
  s.source = { :git => "https://github.com/RokidiOS/RKCooperationCore.git", :branch => "1.0.5_swift5.6.0" }

  s.ios.deployment_target = '9.0'
  
  s.swift_version = '5.0'
  
  s.ios.vendored_frameworks = "Frameworks/*.framework"
  
  s.xcconfig = {
    'ENABLE_BITCODE' => 'NO'
  }
  
  s.dependency 'RKILogger'
  
  s.dependency 'RKIUtils'
  
  s.dependency 'RKIHandyJSON'

  s.dependency 'JuphoonCloudSDK_iOS'

  s.dependency 'Moya', '~> 13.0.1'

  end
