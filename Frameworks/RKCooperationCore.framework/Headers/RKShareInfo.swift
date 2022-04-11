//
//  RKShareInfo.swift
//  Pods
//
//  Created by Rokid on 2021/11/18.
//

import Foundation
import RKIHandyJSON

//  共享类型
@objc public enum RKShareType: Int, HandyJSONEnum {
    case none         = -1 // 没有分享
    case close        = 0  // 结束分享
    case screen       = 1  // 屏幕共享
    case doodle       = 2  // 电子白板
    case slam         = 3  // AR标注
    case pointVideo   = 4  // 视频点选
    case videoControl = 5  // 视频控制
    case imageDoodle  = 99 // 图片标注
    
}

@objcMembers
public class RKShareInfo: NSObject, NSCopying, HandyJSON {
    // String | 频道ID
    public var channelId = "" {
        didSet {
            if !channelId.isEmpty,
               meetingId.isEmpty {
                meetingId = channelId
            }
        }
    }
    // String | 会议id
    public var meetingId = "" {
        didSet {
            if !meetingId.isEmpty,
               channelId.isEmpty {
                channelId = meetingId
            }
        }
    }
    // String | 发起人userId
    public var promoterUserId = "" {
        didSet {
            if !promoterUserId.isEmpty,
               sponsorLicense.isEmpty,
               let user = RKJCMideaManager.shared.userIdUserInfoList[promoterUserId] {
                sponsorLicense = user.license
            }
        }
    }
    // String | 共享用户userId
    public var executorUserId = "" {
        didSet {
            if !executorUserId.isEmpty,
               license.isEmpty,
               let user = RKJCMideaManager.shared.userIdUserInfoList[executorUserId] {
                license = user.license
            }
        }
    }
    // String | 发起人id
    public var sponsorLicense = "" {
        didSet {
            if !sponsorLicense.isEmpty,
               promoterUserId.isEmpty,
               let user = RKJCMideaManager.shared.licenseUserInfoList[sponsorLicense] {
                promoterUserId = user.userId
            }
        }
    }
    // String | 共享用户id
    public var license = "" {
        didSet {
            if !license.isEmpty,
               executorUserId.isEmpty,
               let user = RKJCMideaManager.shared.licenseUserInfoList[license] {
                executorUserId = user.userId
            }
        }
    }
    public var shareImageUrl            = "" // String | 冻屏标注的图片地址
    public var deviceType: RKDeviceType = .IOS // String | 设备端
    public var shareType: RKShareType   = .none //     | 共享类型
    
    required public override init() {}
    
    public func copy(with zone: NSZone?) -> Any {
        
        let copyShareInfo = Self.init()
        copyShareInfo.channelId = self.channelId
        copyShareInfo.promoterUserId = copyShareInfo.promoterUserId
        copyShareInfo.executorUserId = copyShareInfo.executorUserId
        copyShareInfo.sponsorLicense = copyShareInfo.sponsorLicense
        copyShareInfo.license = copyShareInfo.license
        copyShareInfo.shareImageUrl = copyShareInfo.shareImageUrl
        copyShareInfo.meetingId = copyShareInfo.meetingId
        copyShareInfo.deviceType = copyShareInfo.deviceType
        copyShareInfo.shareType = copyShareInfo.shareType
        
        return copyShareInfo
    }
}
