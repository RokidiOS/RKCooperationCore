//
//  RKCooperationConfig.swift
//  Pods
//
//  Created by Rokid on 2021/11/22.
//

import Foundation

@objcMembers
public class RKCooperationCoreConfig: NSObject {
    
    public static let shared = RKCooperationCoreConfig()
    /// 必要参数
    public var coreParams = RKCooperationCoreParams()
    /// 录制参数
    public var recordParams = RKRemoteRecordParams()

}

@objcMembers
public class RKCooperationCoreParams: NSObject {
    
    /// 商户服务器地址 （默认使用标准产品host）
    public var apiHost: String = ""
    /// 用户token
    public var token: String = ""
    /// appKey
    public var appKey: String = ""
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
