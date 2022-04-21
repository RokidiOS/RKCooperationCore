//
//  RKUser.swift
//  Pods
//
//  Created by Rokid on 2021/11/22.
//

import Foundation
import RKIHandyJSON

@objcMembers
public class RKUser: NSObject, HandyJSON {
    /// 用户ID
    public var userId: String = ""
    /// 公司ID
    public var companyId: String?
    /// 用户名
    public var userName: String?
    /// 姓名
    public var realName: String?
    /// 手机号
    public var phone: String?
    /// 头像
    public var avatar: String?

    public func mapping(mapper: HelpingMapper) {
        mapper <<<
            [userId <-- ["deviceUserId", "userId"]]
        
    }
    
    required public override init() {}
}
