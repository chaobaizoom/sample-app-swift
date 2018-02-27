//
//  ViewController.swift
//  MobileRTCSwiftSample
//
//  Created by Robust Hu on 2017/5/17.
//  Copyright © 2017年 Zoom Video Communications, Inc. All rights reserved.
//

import UIKit

var rtc_userid = "qxWBwXZKRteOHnS2nwzE7A";
var rtc_username = "chaobai";
var rtc_token = "8-XdJFEW4knX9K55500MfMOKwiAc3ZMozH8O7h0LhA0.BgMgUldJZnY2aHRPc0hZLzdmaDdwNFZpckFpNlo2UlBPSXpAYTQ1NmIwODhmZThjMGFlZjNjMTMzOTFjZmY4ZjI3ZGZlYzFhMzQ1YjIwN2IwZTYwZWY2NDRhZWNkNDU2YmM4NwAMM0NCQXVvaVlTM3M9";
var rtc_meeting = "8819880823";


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

