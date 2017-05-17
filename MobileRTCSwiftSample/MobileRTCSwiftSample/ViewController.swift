//
//  ViewController.swift
//  MobileRTCSwiftSample
//
//  Created by Robust Hu on 2017/5/17.
//  Copyright © 2017年 Zoom Video Communications, Inc. All rights reserved.
//

import UIKit

var rtc_userid = "";
var rtc_username = "";
var rtc_token = "";
var rtc_meeting = "";


class ViewController: UIViewController, MobileRTCMeetingServiceDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onClickStart(_ sender: AnyObject) {
        
        let service = MobileRTC.shared().getMeetingService();
        if (service == nil){
            return;
        }
        
        service?.delegate = self;
        
        let dic = [kMeetingParam_UserID: rtc_userid,
                   kMeetingParam_UserToken: rtc_token,
                   kMeetingParam_UserType: "99",
                   kMeetingParam_Username: rtc_username,
                   kMeetingParam_MeetingNumber: rtc_meeting,
                   ];
        
        let ret = service?.startMeeting(with: dic);
        print("start meeting ret: \(ret)");
    }
    
    @IBAction func onClickJoin(_ sender: AnyObject) {
        
        let service = MobileRTC.shared().getMeetingService();
        if (service == nil){
            return;
        }
        
        service?.delegate = self;
        
        let dic = [kMeetingParam_Username: rtc_username,
                   kMeetingParam_MeetingNumber: rtc_meeting,
                   ];
        
        let ret = service?.joinMeeting(with: dic);
        print("join meeting ret: \(ret)");
    }
    
    func onMeetingReturn(_ error: MobileRTCMeetError, internalError: Int) {
        print("onMeetingReturn: \(error) internalError: \(internalError) ");
    }
    
    func onMeetingStateChange(_ state: MobileRTCMeetingState) {
        print("onMeetingStateChange: \(state)");
    }
}

