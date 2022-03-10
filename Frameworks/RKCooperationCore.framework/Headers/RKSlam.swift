//
//  RKSlam.swift
//  Pods
//
//  Created by Rokid on 2021/11/17.
//

import Foundation
import RKIHandyJSON
import RKIUtils

// AR标注类型
@objc public enum RKSlamMessageCode: Int, HandyJSONEnum {
    case OK                          = 0  // 标记成功
    case ExceedTheMaximumNumberLimit = 1  // 超过最大标注数量
    case SceneLost                   = 2  // 标注失败，场景已丢失
    case WithdrawalNothing           = 3  // 当前用户没有更多标注可以用来撤销
    case MarkNoFeatures              = 4  // 标记的位置无法获取到纹理特征信息 无法标记
    case MarkNotSupport              = 5  // 设备不支持ar标注
    case OtherError                  = 6  // 其他错误
}

// AR标注类型
@objc public enum RKSlamMessageType: Int, HandyJSONEnum {
    case MarkDoodleUnknown      = -1 // 未知状态
    case MarkDoodleRequest      = 0  // 标记涂鸦请求
    case MarkDoodleResponse     = 1  // 标记涂鸦响应
    case MarkArrowRequest       = 2  // 标记箭头请求
    case MarkArrowResponse      = 3  // 标记箭头响应
    case MarkWithdrawalRequest  = 4  // 撤销ar标注请求
    case MarkWithdrawalResponse = 5  // 撤销ar标注响应
    case MarkClearRequest       = 6  // 清空ar标注请求
    case MarkClearResponse      = 7  // 清空ar标注响应
    case MarkStopRequest        = 8  // 请求退出ar标注
    case MarkStopResponse       = 9  // 请求退出ar标注响应
    case MarkStartRequest       = 10 // 请求进入ar标注
    case MarkStartResponse      = 11 // 请求进入ar标注响应
    case MarkStatusUpdate       = 12 // ar标注slam状态发生改变
    case MarkStateRequest       = 13 // 请求ar标注状态请求
    case MarkSlamExit           = 14 // slam端主动退出
    case MarkCircleRequest      = 15 // 标记圆形圈注请求
    case MarkCircleResponse     = 16 // 标记圆形圈注响应
    case MarkLocalImageRequest  = 17 // 标记本地图片标注请求
    case MarkLocalImageResponse = 18 // 标记本地图片标注响应
    case MarkCloudImageRequest  = 19 // 标记云端图片标注请求
    case MarkCloudImageResponse = 20 // 标记云端图片标注响应
}

// AR标注消息
@objcMembers
public class RKSlamBaseMessage: NSObject, HandyJSON {
    public var channelId: String              = ""                 // | 频道唯一标识 uuid
    public var userId: String                 = ""                 // | 用户ID
    public var messageId: String              = ""                 // | 消息唯一标识 uuid
    public var color: Int                     = 0                  // | AR标注的颜色
    public var pointF: RKPoint                = RKPoint()          // | AR标记点位
    public var messageType: RKSlamMessageType = .MarkDoodleUnknown // | AR标注的消息类型
    public var doodleContent: String          = ""                 // | doodle string
    public var index: Int                     = -1                 // | messageType = MarkLocalImage 需要 0 - 6
    public var imageUrl: String               = ""                 // | messageType = MarkCloudImage 需要
    public var scale: CGFloat                 = 1.0                // | scale 放大尺寸
    public var code: RKSlamMessageCode        = .OK                // | RKSlamMessageCode 错误码
    public var errorMessage: String           = ""                 // | errorMessage 错误描述
    
    required public override init() {}
    
    public init(messageType: RKSlamMessageType) {
        messageId = String.uuid().replacingOccurrences(of: "-", with: "")
        pointF = RKPoint()
        self.messageType = messageType
        super.init()
    }
    
}
