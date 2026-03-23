Pod::Spec.new do |spec|
  spec.name                     = "BidMachine"
  spec.version                  = "3.6.1-beta.1"
  spec.summary                  = "BidMachine iOS SDK"

  spec.homepage                 = "https://bidmachine.io"
  spec.license                  = { :type => 'Commercial', :text => 'https://bidmachine.io/sdk-license-agreement/' }
  spec.author                   = { "Stack" => "https://explorestack.com/bidmachine/" }

  spec.platform                 = :ios, '12.0'
  spec.swift_version            = "5.1"
  
  spec.source = { :http => "https://bidmachine-ios.s3.amazonaws.com/#{spec.name}/#{spec.version}/pod/#{spec.name}.zip" }  
  spec.default_subspec = 'Static'

  spec.subspec 'Static' do |ss|
    ss.vendored_frameworks = ['release/Static/BidMachine.xcframework']

    ss.resource_bundles = {
      'BidMachine' => ['release/Static/BidMachine.xcframework/ios-arm64/**/PrivacyInfo.xcprivacy'],
    }

    ss.dependency 'OMSDK_Appodeal/Static', '1.6.0.3'
  end

  spec.subspec 'Dynamic' do |ss|
    ss.vendored_frameworks = ['release/Dynamic/BidMachine.xcframework']

    ss.dependency 'OMSDK_Appodeal/Dynamic', '1.6.0.3'
  end
end
