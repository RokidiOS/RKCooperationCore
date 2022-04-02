//
//  RKVideoControlMessage.swift
//  RKCooperationCore
//
//  Created by chzy on 2022/1/4.
//

import Foundation
import RKIHandyJSON

public enum VideoCtrType: Int, HandyJSONEnum {
    case lightOnRequest      = 1 /// 开启闪光灯请求
    case lightOnRespond      = 2 /// 开启闪光灯响应
    case lightOffRequest     = 3 /// 开启闪光灯请求
    case lightOffRespond     = 4 /// 关闭闪光灯响应
    
    case scaleModeRequest    = 5 /// 放大请求
    case scaleModeRespond    = 6 /// 放大响应
    case focusPointRequest   = 7 /// 聚焦请求
    case focusPointRespond   = 8 /// 聚焦响应
    
    case establishRequest    = 9 /// 建立连接请求
    case establishRespond    = 10/// 建立连接响应
    case closeRequest        = 11/// 断开连接
    case updateDeviceInfo    = 12///  主动上报设备信息
    case defaul              = 0 /// 什么都不做
}


@objcMembers
public class RKVideoControlMessage: NSObject, HandyJSON {
    public var messageId: String          = ""                 // | 消息唯一标识 uuid
    public var ctrType: VideoCtrType        = .defaul            // | 闪光灯状态
    public var pointF: RKPoint            = RKPoint()          // | 聚焦标记点位
    public var scale: CGFloat               = 1                  // | 放大比例
    public var code: Int                   = 1                  // | pointvideo MessageCode 错误码
    public var errorMessage: String       = ""                 // | errorMessage 错误描述
    public var promoterUserId:    String?                        // | 控制者 ID
    public var executorUserId: String?                          // | 发送者 ID
    
    public var isLightSupport = true                           // | 是否支持闪光灯
    public var isScaleSupport = false                           // | 是否支持摄像头缩放
    public var isFocusSupport = false                          // | 是否支持聚焦
    public var minScale       = 1.0                            // | 最小缩放
    public var maxScale       = 1.0                            // | 最大缩放
    public var scaleGap       = 1.0                            // | 缩放间隔
    required public override init() {}

    public init(messageType: RKSlamMessageType) {
        messageId = String.uuid().replacingOccurrences(of: "-", with: "")
        pointF = RKPoint()
        super.init()
    }
    
}
