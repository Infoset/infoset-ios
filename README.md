# Infoset iOS SDK

Infoset iOS SDK allows you to integrate [Infoset Chat](https://infoset.app) with your iOS app.
[![CocoaPods](https://img.shields.io/badge/platforms-iOS-orange.svg?maxAge=2592000)](https://cocoapods.org/pods/Infoset)
[![Languages](https://img.shields.io/badge/languages-OjbC%20%7C%20%20Swift-orange.svg?maxAge=2592000)](https://github.com/infoset/infoset-ios)
[![Version](https://img.shields.io/cocoapods/v/Infoset.svg?style=flat)](http://cocoapods.org/pods/Infoset)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](#carthage)

## Requirements

- iOS 9.0+
- Xcode 8.0+

## Installation

### Carthage

If you use [Carthage](https://github.com/Carthage/Carthage) to manage your dependencies, simply add 'infoset/infoset-ios' to your `Cartfile`.

```
github "infoset/infoset-ios" ~> 1.0.0
```

Make sure you have added `Infoset.framework` to the "_Linked Frameworks and Libraries_" section of your target, and have include it in your Carthage framework copying build phase.

### CocoaPods

If you use [CocoaPods](http://cocoapods.org) to manage your dependencies, simply add Infoset to your `Podfile`.

```bash
pod 'Infoset', '~> 1.0.0'
```

### Manual Installation

You can integrate iOS chat widget into your project manually without using a dependency manager.

#### Swift

Just drag all files from the `Infoset/Sources` directory into your project.

#### Objective-C

Drag all files from the `Infoset/Sources` directory into your project. When adding first `*.swift` file to Objective-C project, Xcode will ask you to create a Bridging Header. It is not necessary for chat widget to work, so you can decline unless you plan to call Swift code from Objective-C. More information about bridging headers and Swift and Objective-C interoperability can be found [here](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/BuildingCocoaApps/MixandMatch.html). You need to put the following import statement: `#import "<Your Project Name>-Swift.h"` at the top of your .m file.

Also, for Objective-C projects, you need to set the **Embedded Content Contains Swift Code** flag in your project to `Yes` (found under **Build Options** in the **Build Settings** tab).

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

See `InfosetChatVisitor.swift` for all of the user fields.

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

### Sending files from device library

If you have file sharing enabled for the visitors, you should provide usage description by including:

- `NSPhotoLibraryUsageDescription` (`Privacy - Photo Library Usage Description`)
- `NSCameraUsageDescription` (`Privacy - Camera Usage Description`)
- `NSMicrophoneUsageDescription` (`Privacy - Microphone Usage Description`)

keys in your `Info.plist` file to avoid crashes on iOS 10 or higher. You can check `Info.plist` files in example projects.

## Sample Apps

Sample apps for both Swift and Objective-C can be found in the `Examples` folder.

## React Native Support

We have a [React Native SDK](https://github.com/infoset/infoset-rn) for React Native / Expo.

## Getting help

If you have any questions or want to provide feedback, [shoot an email](mailto:support@infoset.app) or [chat with us!](https://infoset.app/tr/)