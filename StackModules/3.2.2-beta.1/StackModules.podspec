Pod::Spec.new do |s|
  s.name         = "StackModules"
  s.version      = "3.2.2-beta.1"
  s.summary      = "Supported modules for Stack iOS products"

  s.description  = <<-DESC
                   Supported modules for Stack iOS products. Used in Appodeal, BidMachine and DataCore
                   DESC

  s.homepage     = "https://appodeal.com"


  s.license      = {
    :type => "Commercial License",
    :text => "Copyright #{Time.new.year}. Appodeal Inc. All rights reserved.\nThe #{s.name} is available under a commercial license (https://appodeal.com/sdk-license-agreement)."
  }

  s.author       = { 
    "Stack" => "http://www.explorestack.com" 
  }

  s.platform     = :ios, '12.0'
  s.source       = { 
    :http => "https://bidmachine-ios.s3.amazonaws.com/#{s.name}/#{s.version}/pod/#{s.name}.zip"
  }

  s.default_subspec   = "Static"
  s.swift_versions    = "4.0", "4.2", "5.0", "5.1"
  s.swift_version = "5.1"
  s.frameworks = 'SafariServices', 'StoreKit', 'WebKit', 'CoreTelephony', 'SystemConfiguration', 'AdSupport', 'CoreLocation', 'MobileCoreServices', 'AVFoundation', 'AudioToolbox', 'UIKit', 'ImageIO', 'CoreGraphics', 'QuartzCore'
  s.library = 'z'

  # Dynamic subspecs
  s.subspec 'Dynamic' do |ss|
    ss.dependency 'StackModules/Core-Dynamic'
    ss.dependency 'StackModules/ProductPresentation-Dynamic'
    ss.dependency 'StackModules/Rendering-Dynamic'
  end
  
  s.subspec 'Core-Dynamic' do |ss|
    ss.vendored_frameworks = 'release/Dynamic/StackModules.xcframework'
  end

  s.subspec 'ProductPresentation-Dynamic' do |ss|
    ss.vendored_frameworks = 'release/Dynamic/StackProductPresentation.xcframework'
    ss.dependency 'StackModules/Core-Dynamic'
  end

  s.subspec 'Rendering-Dynamic' do |ss|
    ss.vendored_frameworks = 'release/Dynamic/StackRendering.xcframework'
    ss.dependency 'StackModules/Core-Dynamic'
    ss.dependency 'StackModules/ProductPresentation-Dynamic'
    ss.dependency 'OMSDK_Appodeal', '1.5.5'
  end
  
  # Static subspecs
  s.subspec 'Static' do |ss|
    ss.dependency 'StackModules/Core-Static'
    ss.dependency 'StackModules/ProductPresentation-Static'
    ss.dependency 'StackModules/Rendering-Static'
  end

  s.subspec 'Core-Static' do |ss|
    ss.vendored_frameworks = 'release/Static/StackModules.xcframework'
    ss.resource_bundles = {
      'StackModules' => ['release/Static/StackModules.xcframework/ios-arm64/**/PrivacyInfo.xcprivacy']
    }
  end

  s.subspec 'ProductPresentation-Static' do |ss|
    ss.vendored_frameworks = 'release/Static/StackProductPresentation.xcframework'
    ss.dependency 'StackModules/Core-Static'
    ss.resource_bundles = {
      'StackProductPresentation' => ['release/Static/StackProductPresentation.xcframework/ios-arm64/**/PrivacyInfo.xcprivacy'],
    }
  end

  s.subspec 'Rendering-Static' do |ss|
    ss.vendored_frameworks = 'release/Static/StackRendering.xcframework'
    ss.dependency 'StackModules/Core-Static'
    ss.dependency 'StackModules/ProductPresentation-Static'
    ss.dependency 'OMSDK_Appodeal', '1.5.5'
    ss.resource_bundles = {
      'StackRendering' => ['release/Static/StackRendering.xcframework/ios-arm64/**/PrivacyInfo.xcprivacy'],
    }
  end

  s.pod_target_xcconfig = {
    "OTHER_LDFLAGS": '-ObjC'
  }
end