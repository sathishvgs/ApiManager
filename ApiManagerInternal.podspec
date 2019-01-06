#
#  Be sure to run `pod spec lint ApiManager.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "ApiManagerInternal"
  s.version      = "0.0.1"
  s.summary      = "A Library For Internal purpose"
  s.description  = <<-DESC
  A nice ApiManager file which will be helpful for Networking
                   DESC

  s.homepage     = "https://github.com/sathishvgs"
  s.license      = { :type => "MIT", :file => "license" }
  s.author             = { "Sathish kumar" => "vgsathish1995@gmail.com" }

  s.platform     = :ios
  s.ios.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/sathishvgs/ApiManager.git", :tag => s.version.to_s }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  s.source_files  = "ApiManager", "ApiManager/**/*.{h,m,swift}"
  s.dependency "Alamofire", "~> 4.0"

end
