//
//  RKMessage.swift
//  Pods
//
//  Created by Rokid on 2021/11/18.
//

import Foundation
import RKIHandyJSON
import RKIUtils

/// 消息类型

public enum RKMsgType: String, HandyJSONEnum {
    case UnExtra             // 除Extra所有消息
    /** 以下部分为在线消息 */
    case Extra               // 透传外部消息
    case Call                // 发起呼叫
    case CallReject          // 拒接呼叫
    case CallBusy            // 正忙
    case CallCancel          // 取消发起通话
    case CallAccept          // 接听通话
    /** 以下部分为会议内消息 */
    case Share               // 用于共享消息（如截图涂鸦、涂鸦白板、共享屏幕等状态）
    case Doodle              // 用于涂鸦消息
    case DoodleRequest       // 后入会者，请求最新涂鸦内容
    case DoodleResponse      // 返回请求的最新涂鸦内容
    case Slam                // 用于AR标注，Slam通讯消息
    case PointVideo          = "videoPoint"// 用于视频点选
    case VideoControl        = "videoControll"// 用于视频控制
    
    /** 以下部分为兼容消息*/
    case KeepSilence         // 全员静音
    case SyncUserInfo            // 用于同步设备信息 如是否支持slam等 后续可扩展为其他用途 （弃用）
    case UserInfoRequest         // 用于同步设备信息 如是否支持slam等 后续可扩展为其他用途
    case UserInfoResponse        // 用于同步设备信息 如是否支持slam等 后续可扩展为其他用途
    case OneStreamUserChange     // 单路视频切换
    case SyncMeetingInfoRequest  // 发送同步会议信息请求，用于后加入会议人员获取会议状态
    case SyncMeetingInfoResponse // 用于同步会议信息返回结果
}

/// 消息体
@objcMembers
public class RKMessage: NSObject, HandyJSON {
    public var version: Double      = 0.0       // Double    | 消息协议版本，用于兼容等
    public var msgId: String        = ""        // String    | 消息唯一标识id 随机生成uuid
    public var timestamp: Int64     = 0         // Long      | 发送时间,时间戳
    public var fromUserId: String   = ""        // String    | 发送用户id
    public var msgType: RKMsgType   = .UnExtra  // RKMsgType | 消息类型
    public var msgBody: String      = ""        // String    | 自定义消息体，jsonString
    /**
     ### 以下msgType 对应 msgBody消息体规则：
     | Doodle                 | 传递jcDoodle.stringFromDoodleAction转换的字符串
     | DoodleResponse | 传递涂鸦发起方保存下来的每一笔涂鸦数据
     | Slam                    | SlamBaseMessage ar标注的对象类型
     | Call                      | MeetingLife 会议详细信息对象，用于同步各端的会议信息状态
     | Share                   | ShareInfo 每次共享状态改变后发送最新状态通知各端
     */
    
    required public override init() {}
    
    public init(msgType: RKMsgType, msgBody: String) {
        version = 2.0
        msgId = String.uuid().replacingOccurrences(of: "-", with: "")
        fromUserId = RKUserManager.shared.userInfo?.userId ?? ""
        timestamp = Int64(Date.init().timeIntervalSince1970)
        self.msgType = msgType
        self.msgBody = msgBody
        super.init()
    }
}
