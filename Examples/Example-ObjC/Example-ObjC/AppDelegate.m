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
    
    InfosetChat.apiKey = @"pFz6QIAxs8Gmf56R8u4kYNwo1apWCNTrN5YJSET0"; // Set api key
    InfosetChat.iosKey = "123" // Set your API key
    
    InfosetChat.delegate = self;
    
    return YES;
}

#pragma mark - InfosetChatDelegate

- (void)receivedWithMessage:(InfosetChatMessage *)message {
    if (!InfosetChat.isChatPresented) {
        // Notifying user
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Support" message:message.text preferredStyle:UIAlertControllerStyleAlert];
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

@end
