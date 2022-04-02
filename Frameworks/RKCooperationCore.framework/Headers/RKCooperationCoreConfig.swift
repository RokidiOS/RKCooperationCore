//
//  RKCooperationConfig.swift
//  Pods
//
//  Created by Rokid on 2021/11/22.
//

import Foundation

class RKCooperationCoreConfig: NSObject {
    
    static let shared = RKCooperationCoreConfig()
    /// 必要参数
    var coreParams: RKCooperationCoreParams?
    /// 录制参数
    var recordParams: RKRemoteRecordParams?
}

@objcMembers
public class RKCooperationCoreParams: NSObject {
    
    /// SaaS 服务器地址
    public var saasUrl: String = ""
    /// rtc 服务器地址
    public var rtcUrl: String = ""
    /// socket 服务器地址
    public var wssUrl: String = ""
}

@objcMembers
public class RKRemoteRecordParams: NSObject {
    
    public var secretKey: String = ""
    
    public var accessKey: String = ""
    
    public var bucketName: String = ""
    
    public var fileName: String = ""
    
    public var directory: String = ""
        
    public var uploadEndPoint : String?
}
