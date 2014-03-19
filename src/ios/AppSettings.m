//
//  AppSettings.m
//  MobilePOS
//
//  Created by Dennis on 1/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppSettings.h"

@implementation AppSettings


- (void)getAppSettings:(CDVInvokedUrlCommand*)command{
    
 	@try {
    
        CDVPluginResult *pluginResult = nil;
        
		NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
		NSString *hostUrl = [settings stringForKey:@"hostUrl"];
		NSString *hwVendor = [settings valueForKey:@"hwVendor"];
        NSString *integrationVendor = [settings valueForKey:@"integrationVendor"];
		NSString *autoSignoffTimeout = [settings stringForKey:@"autoSignoffTimeout"];
		NSString *debugMode = [settings stringForKey:@"debugMode"];
        NSString *version = [settings stringForKey:@"version"];
        NSString *pcRequestTimeout = [settings stringForKey:@"pcRequestTimeout"];
        //logo
        //NSString *dfsLogo = [settings stringForKey:@"dfsLogo"];
		
		NSMutableDictionary *dicSettings = [[NSMutableDictionary alloc] init];
		[dicSettings setObject:hostUrl forKey:@"hostUrl"];
		[dicSettings setObject:hwVendor forKey:@"hwVendor"];
        [dicSettings setObject:integrationVendor forKey:@"integrationVendor"];
		[dicSettings setObject:autoSignoffTimeout forKey:@"autoSignoffTimeout"];
		[dicSettings setObject:debugMode forKey:@"debugMode"];
        [dicSettings setObject:version forKey:@"version"];
        [dicSettings setObject:pcRequestTimeout forKey:@"pcRequestTimeout"];
        //[dicSettings setObject:dfsLogo forKey:@"dfsLogo"];
		
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dicSettings];
		if ([dicSettings count]>0)
			[self writeJavascript: [pluginResult toSuccessCallbackString:command.callbackId]];
		else
			[self writeJavascript: @"window.plugins.AppSettings.getAppSettingsFail('No App Setting found');"];
	}
	@catch (NSException *exception) {
		[self writeJavascript:[[NSString alloc] initWithFormat:@"window.plugins.AppSettings.getAppSettingsFail('Exception: %@');", [exception description]]];
		NSLog(@"%@", [exception description]);
	}
	@finally {
		
	}

    
}


- (void)setAppSettings:(CDVInvokedUrlCommand*)command{
	@try {
        NSMutableDictionary *options = [command.arguments objectAtIndex:0];
		NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
		NSString *hostUrl = [options valueForKey:@"hostUrl"];
		NSString *hwVendor = [options valueForKey:@"hwVendor"];
		NSString *autoSignoffTimeout = [options valueForKey:@"autoSignoffTimeout"];
        NSString *version = [options valueForKey:@"version"];
	
		[settings setValue:hostUrl forKey:@"hostUrl"];
		[settings setValue:hwVendor forKey:@"hwVendor"];
		[settings setValue:autoSignoffTimeout forKey:@"autoSignoffTimeout"];
        [settings setValue:version forKey:@"version"];
		[settings synchronize];
        
        NSLog(@"Mobile Pos Version : %@", version);
		[self writeJavascript:@"window.plugins.AppSettings.setAppSettingsResult('Settings updated');"];
      
	}
	@catch (NSException *exception) {
		[self writeJavascript:[[NSString alloc] initWithFormat:@"window.plugins.AppSettings.setAppSettingsResult('Exception: %@');", [exception description]]];
		NSLog(@"%@", [exception description]);
	}
	@finally {

	}
	
}


@end
