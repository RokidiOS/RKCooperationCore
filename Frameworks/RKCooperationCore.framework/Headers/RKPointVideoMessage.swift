//
//  RKPointVideoMessage.swift
//  RokidExpert
//
//  Created by Rokid on 2021/12/29.
//

import Foundation
import RKIHandyJSON

@objc public enum RKPointVideoAction: Int, HandyJSONEnum {
   case point = 0
   case req = 1
   case res = 2
}

@objcMembers
public class RKPointVideoMessage: NSObject, HandyJSON {
    public var channelId: String          = ""                 // | 频道ID
    public var userId: String             = ""                 // | 发送人userId
    public var messageId: String          = ""                 // | 消息唯一标识 uuid
    public var color: Int                 = 0                  // | 点位标注的颜色
    public var pointF: RKPoint            = RKPoint()          // | 点位标记点位
    public var width: Float               = 1.0                // |  宽度放大尺寸
    public var code: Int                  = 1                  // | pointvideo MessageCode 错误码
    public var errorMessage: String       = ""                 // | errorMessage 错误描述
    public var actionType: RKPointVideoAction = .point         //  ｜ 是否0 为视频点选，1建立连接请求， 2建立连接请求
    
    required public override init() {}

    public init(messageType: RKSlamMessageType) {
        messageId = String.uuid().replacingOccurrences(of: "-", with: "")
        pointF = RKPoint()
        super.init()
    }
    
}
