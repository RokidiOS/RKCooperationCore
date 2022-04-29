//
//  RKIJoinedChannel.swift
//  Alamofire
//
//  Created by Amos on 2022/3/25.
//

import Foundation
import RKIHandyJSON

@objcMembers
public class RKIJoinedChannel: NSObject, HandyJSON {
    // 频道ID
    public var channelId: String = ""
    // 频道密码
    public var password: String = ""
    // 频道名称
    public var channelName: String?
    // 频道主题
    public var channelSubject: String?
    // 频道最大成员
    public var maxMembers: Int32?
    // 频道最大分辨率
    public var maxResolution: RKResolution?
    // 频道拓展参数
    public var extraParams: String?
    // 频道透传字段
    public var remark: String?
    // 频道成员ID列表
    public var membersList: [String]?

    required public override init() {}
}
