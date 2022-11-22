//
//  AppDelegate.m
//  Example-ObjC
//
//  Created by Samed Düzçay on 22/09/2020.
//  Copyright © 2020 Infoset Teknoloji A.S. All rights reserved.
//

#import "AppDelegate.h"
@import Infoset;

@interface AppDelegate () <InfosetChatDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    InfosetChat.apiKey = @"your_api_key"; // Set your API key
    InfosetChat.iosKey = @"ios_key"; // Set your iOS key
    
    InfosetChat.delegate = self;
    
    return YES;
}

#pragma mark - InfosetChatDelegate

- (void)receivedWithMessage:(InfosetChatMessage *)message {
    if (!InfosetChat.isChatPresented) {
        // Notifying user
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Support" message:message.message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *chatAction = [UIAlertAction actionWithTitle:@"Go to Chat" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            // Presenting chat if not presented:
            if (!InfosetChat.isChatPresented) {
                [InfosetChat presentChatWithAnimated:YES completion:nil];
            }
        }];
        [alert addAction:chatAction];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancelAction];
        
        [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
    }
}

- (void)handleWithURL:(NSURL *)URL {
    [[UIApplication sharedApplication] openURL:URL];
}

- (void)roomOpenedWithRoomId:(int64_t)roomId {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Room opened" message:@(roomId).stringValue preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancelAction];

    [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
}

- (void)roomClosedWithRoomId:(int64_t)roomId {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Room closed" message:@(roomId).stringValue preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancelAction];

    [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
}

- (void)roomReopenedWithRoomId:(int64_t)roomId {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Room reopened" message:@(roomId).stringValue preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancelAction];

    [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
}

@end
