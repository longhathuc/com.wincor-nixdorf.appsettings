//
//  AppSettings.h
//  MobilePOS
//
//  Created by Dennis on 1/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import <Cordova/CDVPlugin.h>
#import <UIKit/UIKit.h>

@interface AppSettings: CDVPlugin{
}

- (void)getAppSettings:(CDVInvokedUrlCommand*)command;
- (void) setAppSettings:(CDVInvokedUrlCommand*)command;
@end