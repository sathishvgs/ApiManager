#
#  Be sure to run `pod spec lint ApiManager.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "ApiManagerInternal"
  s.version      = "0.0.7"
  s.summary      = "A Library For Internal purpose"
  s.description  = <<-DESC
  A nice ApiManager file which will be helpful for Networking
                   DESC

  s.homepage     = "https://github.com/sathishvgs"
  s.license      = { :type => "MIT", :file => "license" }
  s.author             = { "Sathish kumar" => "vgsathish1995@gmail.com" }

  s.platform     = :ios
  s.ios.deployment_target = "9.0"

  s.source       = { git: 'https://github.com/sathishvgs/ApiManager.git', :tag => s.version.to_s }

  #s.source	 = { :http => 'https://github.com/sathishvgs/ApiManagerZIP/raw/  
  #ApiManagerZIP_1/ApiManager.zip' } // ZIP

  #s.source_files  = "ApiManager", "ApiManager/**/*.{h,m,swift}"
  s.source_files = 'ApiManager/ApiFrameworks/*'


  # Framework1 
  s.subspec 'Framework1' do |sp|
    sp.source_files = 'ApiManager/ApiFrameworks/Framework1/*.swift'
  end

  # Framework2
  s.subspec 'Framework2' do |sp|
    sp.source_files = 'ApiManager/ApiFrameworks/Framework2/*.swift'
  end


  #s.exclude_files = "Classes/Exclude". // ZIP
  s.dependency "Alamofire", "~> 4.0"

  #s.frameworks = 'ApiManager' // ZIP
  #s.ios.vendored_frameworks = 'ApiManager.framework' // ZIP

end
