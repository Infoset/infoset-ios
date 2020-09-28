[![CocoaPods](https://img.shields.io/badge/platforms-iOS-orange.svg?maxAge=2592000)](https://cocoapods.org/pods/Infoset)
[![Languages](https://img.shields.io/badge/languages-OjbC%20%7C%20%20Swift-orange.svg?maxAge=2592000)](https://github.com/infoset/infoset-ios)
[![Version](https://img.shields.io/cocoapods/v/Infoset.svg?style=flat)](http://cocoapods.org/pods/Infoset)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](#carthage)

<img src="https://user-images.githubusercontent.com/13895224/94475996-8de39c80-01d8-11eb-8771-e590b33c612e.png" alt="Infoset" width="340" />

# Infoset iOS SDK

Infoset iOS SDK allows you to integrate [Infoset Chat](https://infoset.app) with your iOS app.

## Requirements

- iOS 9.0+
- Xcode 8.0+

## Installation

### CocoaPods

If you use [CocoaPods](http://cocoapods.org) to manage your dependencies, simply add Infoset to your `Podfile`.

```bash
    target :YourTargetName do
      pod 'Infoset'
    end
```

### Carthage

If you use [Carthage](https://github.com/Carthage/Carthage) to manage your dependencies, simply add 'infoset/infoset-ios' to your `Cartfile`.

1. Add `github "infoset/infoset-ios"` to your Cartfile.
2. Run `carthage update`.
3. Go to your Xcode project's "General" settings. Drag `Infoset.framework` from `Carthage/Build/iOS` to the "Embedded Binaries" section. Make sure “Copy items if needed” is selected and click Finish.

### Manual Installation

You can integrate Infoset iOS SDK into your project manually without using a dependency manager.

1. Download [Infoset iOS SDK](https://github.com/infoset/infoset-ios/archive/master.zip) and extract the zip.
2. Drag `Infoset.framework` into your project.  
<img width="255" alt="" src="https://user-images.githubusercontent.com/13895224/94475518-d9e21180-01d7-11eb-8820-00123839d275.png">

Make sure "Copy items if needed" is selected and click Finish.  
<img width="600" alt="" src="https://user-images.githubusercontent.com/13895224/94475576-f0886880-01d7-11eb-95b9-ae6b9a708660.png">

3. In the target settings for your app, set the Infoset.framework to “Embed & Sign”. This can be found in the “Frameworks, Libraries, and Embedded Content” section of the “General” tab.
<img width="600" alt="" src="https://user-images.githubusercontent.com/13895224/94476104-afdd1f00-01d8-11eb-8503-a07275754054.png">

4. Create a new "Run Script Phase" in your app’s target’s "Build Phases" and paste the following snippet in the script text field:

```
    bash "${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}/Infoset.framework/strip-frameworks.sh"
```

This step is required to work around an [App Store submission bug](http://www.openradar.me/radar?id=6409498411401216) when archiving universal binaries.

### Update Info.plist

If you have file sharing enabled in your Infoset chat widget, you'll need to make sure these entries exist in your `Info.plist` to avoid crashes on iOS 10 or higher:

- `NSPhotoLibraryUsageDescription` (`Privacy - Photo Library Usage Description`)
- `NSCameraUsageDescription` (`Privacy - Camera Usage Description`)
- `NSMicrophoneUsageDescription` (`Privacy - Microphone Usage Description`)

You can check `Info.plist` files in example projects.

## Usage

### Initalization

```swift
import Infoset

InfosetChat.apiKey = "YOUR_WIDGET_API_KEY"
InfosetChat.iosKey = "YOUR_WIDGET_IOS_KEY"
```

### Presenting Chat Widget

```swift
InfosetChat.presentChat()
```

Chat widget will be dismissed when the user clicks the dismiss button. You can dismiss it programmatically as well:
```swift
InfosetChat.dismissChat()
```

### Using UIWindowSceneDelegate

If your app is using UIWindowScene API you need to perform additional configuration steps in you window scene delegate class.

```swift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        InfosetChat.windowScene = (scene as? UIWindowScene)
    }
}
```

### Setting User Variables

You can provide your user's details such as name and email if they are known, so you will immediately know who you are talking to on the Infoset dashboard:

```swift
InfosetChat.visitor = InfosetChatVisitor(id: 123, email: "example@infoset.app", firstName: "John", lastName: "Doe")
```

All fields are optiona. See the `InfosetChatVisitor` class for all of the user fields.

### Assign chat to tags

You can route your chats to specific tags by providing `tags`.

```swift
InfosetChat.tags = "High Priority"
```

You can provide multiple tags separated by commas.

```swift
InfosetChat.tags = "Support,Recurring Customer"
```

### Notifying the user about the agent's response

You can subscribe to incoming messages and notify the user even if the chat window is minimized. To handle incoming messages, your class must implement `InfosetChatDelegate` protocol and set itself as `InfosetChat.delegate`.

```swift
class YOUR_CLASS_NAME : InfosetChatDelegate { // Your class need to implement InfosetChatDelegate protocol
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    InfosetChat.apiKey = "YOUR_WIDGET_API_KEY"
    InfosetChat.iosKey = "YOUR_WIDGET_IOS_KEY"
    InfosetChat.delegate = self // Set self as delegate

    return true
  }

  func received(message: InfosetChatMessage) {
    print("Received message: \(message.text)")
    // Handle message here
  }
}
```

### Handling URLs

By default, all links in chat messages are opened in Safari. To change this behavior you can use the `InfosetChatDelegate` to handle URLs yourself.

```swift
func handle(URL: URL) {
  print("URL is \(URL.absoluteString)")
  // Handle URL here
}
```

## Sample Apps

Sample apps for both Swift and Objective-C can be found in the `Examples` folder.

## React Native Support

We have a [React Native SDK](https://github.com/infoset/infoset-react-native) for React Native / Expo ⚛️

## Getting help

If you have any questions or want to provide feedback, [shoot an email](mailto:support@infoset.app) or [chat with us!](https://infoset.app/tr/)
