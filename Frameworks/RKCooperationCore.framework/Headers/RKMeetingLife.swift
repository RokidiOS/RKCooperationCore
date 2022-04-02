//
//  RKMeetingLife.swift
//  Pods
//
//  Created by Rokid on 2021/11/18.
//

import Foundation
import RKIHandyJSON
import RKIUtils

@objcMembers
public class RKMeetingLife: NSObject, HandyJSON  {
    // 频道ID
    public var channelId: String = ""
    public var channelTitle: String = ""
    public var meetingId: String = ""
    public var meetingTitle: String = ""
    public var createTime: Int64         = 0        // | 会议创建时间
    public var endTime: Int64            = 0        // | 会议退出时间
    public var shareInfo: RKShareInfo?   = nil      // | 保存的共享状态对象
    public var meetingServerId: String   = ""       // | 查询服务端会议信息id
    public var serverId: String          = ""       // | 群聊id
    public var inviteId: String          = ""       // | 邀请入会人员id
    public var oneStreamUserId: String   = ""       // | 单流视频id
    public var moderator: String         = ""       // | 主持人id
    public var resolution: String        = ""       // | 最大分辨率
    public var userDevices: [RKUserDevice]?  = nil  // | 当前会议成员信息列表
    
    // V1.0
    public var channelParam: RKChannelParam? = nil  // | 频道参数
    
    required public override init() {
        createTime = Int64(Date().timeIntervalSince1970 * 1000)
    }
}

//  设备类型
public enum RKDeviceType: String, HandyJSONEnum {
    case Android
    case IOS
    case Web
    case PC
    case Glass
}

// 设备信息
@objcMembers
public class RKUserDevice: NSObject, HandyJSON  {
    public var appVersion: Float         = 1.0   // | 应用版本version code 如100
    public var supportSlam: Bool         = false // | 是否支持slam
    public var userInfo: RKCompanyUser?  = nil   // | 服务端返回的用户信息
    public var deviceType: RKDeviceType  = .IOS  // | 设备类型
    
    required public override init() {}
    
}

