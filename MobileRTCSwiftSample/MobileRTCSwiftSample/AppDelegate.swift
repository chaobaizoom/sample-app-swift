//
//  AppDelegate.swift
//  MobileRTCSwiftSample
//
//  Created by Robust Hu on 2017/5/17.
//  Copyright © 2017年 Zoom Video Communications, Inc. All rights reserved.
//

import UIKit

var rtc_appkey      = "QjJX5NPYQLOgGhWGV1yX9w";
var rtc_appsecret   = "ZyLj97qe4ICXY2YEQtP3q9bQuBzlbGE6wBLV";
var rtc_domain      = "zoom.us";

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, MobileRTCAuthDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        sdkAuth();
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func sdkAuth(){
        MobileRTC.shared().setMobileRTCDomain(rtc_domain);
        
        let service = MobileRTC.shared().getAuthService();
        if (service != nil) {
            service?.delegate = self;
            
            service?.clientKey = rtc_appkey;
            service?.clientSecret = rtc_appsecret;
            
            service?.sdkAuth();
        }
    }
    
    func onMobileRTCAuthReturn(_ returnValue: MobileRTCAuthError){
        print("onMobileRTCAuthReturn....  \(returnValue)");
    }
    
}

