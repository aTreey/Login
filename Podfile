# Uncomment the next line to define a global platform for your project
 platform :ios, '10.0'
source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/aTreey/MyGitSpec.git'
source 'https://cdn.cocoapods.org/'

install! 'cocoapods',
generate_multiple_pod_projects: true

target 'LoginOC' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
   use_frameworks!
   
   # 远程私有库
   pod 'LGUitls', :project_name => 'PrivateModule'
   pod 'LGEffectiveObjectiveC', :project_name => 'PrivateModule'
   pod 'LGObjectiveCPro', :project_name => 'PrivateModule'
   
   # 本地私有库
   # pod 'LGNetworking', :path => './LoginModule/LGNetworking'
   
   pod 'CTMediator'
   pod "DesignPattern", :path => "../DesignPattern"
   pod "DesignPattern_Category", :path => "../DesignPattern_Category"
  
pod 'Masonry', :project_name => 'AutoLayout'

pod 'AFNetworking', :project_name => 'Networking'
pod 'SDWebImage', :project_name => 'Networking'
pod 'KissXML', :project_name => 'ParseData'

pod 'SCRecorder', :project_name => 'Media'
pod 'NELivePlayer', :project_name => 'Media'

pod 'HyphenateLite', :project_name => 'IM'

pod 'SVProgressHUD', :project_name => 'HUD'

pod 'Aspects', :project_name => 'AOP'

  # Pods for LoginOC

  target 'LoginOCTests' do
    inherit! :search_paths
    # Pods foter testing
  end

  target 'LoginOCUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
