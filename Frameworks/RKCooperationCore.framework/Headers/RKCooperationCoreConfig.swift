//
//  RKCooperationConfig.swift
//  Pods
//
//  Created by Rokid on 2021/11/22.
//

import Foundation
import RKIHandyJSON

@objcMembers
public class RKCooperationCoreParams: NSObject, HandyJSON {
    
    /// SaaS 服务器地址
    @objc public var saasUrl: String = ""
    /// rtc 服务器地址
    @objc public var rtcUrl: String = ""
    /// socket 服务器地址
    @objc public var wssUrl: String = ""
    
    required public override init() {}
}
