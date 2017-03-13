//
//  ViewController.swift
//  ZoomSDKSwiftSample
//
//  Created by Robust on 2016/10/12.
//  Copyright © 2016年 Zoom Video Communications, Inc. All rights reserved.
//

import UIKit

var sdk_userid = "";
var sdk_username = "";
var sdk_token = "";
var sdk_meeting = "";


class ViewController: UIViewController, ZoomSDKMeetingServiceDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onClickStart(sender: AnyObject) {
        
        let service = ZoomSDK.sharedSDK().getMeetingService();
        if (service == nil) {
            return;
        }
        service.delegate = self;
        
        let dic = [kMeetingParam_UserID:sdk_userid,
                   kMeetingParam_UserToken:sdk_token,
                   kMeetingParam_UserType:"99",
                   kMeetingParam_Username:sdk_username,
                   kMeetingParam_MeetingNumber:sdk_meeting,
                   ];
        
        let ret = service.startMeetingWithDictionary(dic);
        print("start meeting ret: \(ret)");
    }

    @IBAction func onClickJoin(sender: AnyObject) {
        
        let service = ZoomSDK.sharedSDK().getMeetingService();
        if (service == nil) {
            return;
        }
        service.delegate = self;
        
        let dic = [kMeetingParam_Username:sdk_username,
                   kMeetingParam_MeetingNumber:sdk_meeting,
                   ];
        
        let ret = service.joinMeetingWithDictionary(dic);
        print("join meeting ret: \(ret)");
    }
}

