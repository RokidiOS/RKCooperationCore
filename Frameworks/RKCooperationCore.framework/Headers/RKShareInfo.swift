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
    public var channelId                = ""    // String | 频道ID
    public var promoterUserId           = ""    // String | 发起人userId
    public var executorUserId           = ""    // String | 共享用户userId
    public var shareImageUrl            = ""    // String | 冻屏标注的图片地址
    public var deviceType: RKDeviceType = .IOS  // String | 设备端
    public var shareType: RKShareType   = .none // RKShareType | 共享类型
    
    required public override init() {}
    
    public func copy(with zone: NSZone?) -> Any {
        
        let copyShareInfo = Self.init()
        copyShareInfo.channelId = self.channelId
        copyShareInfo.promoterUserId = copyShareInfo.promoterUserId
        copyShareInfo.executorUserId = copyShareInfo.executorUserId
        copyShareInfo.shareImageUrl = copyShareInfo.shareImageUrl
        copyShareInfo.deviceType = copyShareInfo.deviceType
        copyShareInfo.shareType = copyShareInfo.shareType
        
        return copyShareInfo
    }
}
