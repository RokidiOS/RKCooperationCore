//
//  RKUser.swift
//  Pods
//
//  Created by Rokid on 2021/11/22.
//

import Foundation
import RKIHandyJSON

public class RKUser: NSObject, HandyJSON {
    /// 公司ID
    public var companyId: String = ""
    /// 用户ID
    public var userId: String = ""
    /// 用户名
    public var userName: String = ""
    /// 姓名
    public var realName: String = ""
    /// 手机号
    public var phone: String = ""
    /// 头像
    public var avatar: String = ""
    /// 设备信息
    public var deviceInfo: RKDeviceInfo?
    
    public func mapping(mapper: HelpingMapper) {
        mapper <<<
            [userId <-- ["deviceUserId", "userId"]]
        
    }
    
    required public override init() {}
    
    /// 设备信息
    public class RKDeviceInfo: NSObject, HandyJSON {
        // 设备类型 1-android  2-ios  3-pc  4-glass  5-web
        public var deviceType: Int = 2
        /// 是否支持AR标注
        public var isSlam: Bool = false
        /// 推送ID
        public var registerId: String?
        
        required public override init() {}
        
    }
    
}
