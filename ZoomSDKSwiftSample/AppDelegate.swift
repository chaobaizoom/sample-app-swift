//
//  AppDelegate.swift
//  ZoomSDKSwiftSample
//
//  Created by Robust on 2016/10/12.
//  Copyright © 2016年 Zoom Video Communications, Inc. All rights reserved.
//

import UIKit

var zoomsdk_appkey      = "";
var zoomsdk_appsecret   = "";
var zoomsdk_domain      = "";

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, ZoomSDKAuthDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentationDirectory, NSSearchPathDomainMask.UserDomainMask, true);
        print(paths[0]);
        
        sdkAuth();
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func sdkAuth(){
        ZoomSDK .sharedSDK().zoomDomain = zoomsdk_domain
        
        let service = ZoomSDK.sharedSDK().getAuthService();
        service.delegate = self;
        
        service.clientKey = zoomsdk_appkey;
        service.clientSecret = zoomsdk_appsecret;
        
        service.sdkAuth();
    }

    func onZoomSDKAuthReturn(returnValue: ZoomSDKAuthError){
        print("onZoomSDKAuthReturn....  \(returnValue)");
    }
}

