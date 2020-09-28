//
//  ViewController.m
//  Example-ObjC
//
//  Created by Samed Düzçay on 22/09/2020.
//  Copyright © 2020 Infoset Teknoloji A.S. All rights reserved.
//

#import "ViewController.h"
@import Infoset;
@import MapKit;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Infoset";
}

- (IBAction)openChat:(id)sender {
    //Presenting chat:
    [InfosetChat presentChatWithAnimated:YES completion:nil];
}

- (IBAction)clearSession:(id)sender {
    //Clearing session:
    [InfosetChat clearSession];
}

@end
