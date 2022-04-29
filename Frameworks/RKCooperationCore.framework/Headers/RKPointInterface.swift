//
//  RKPointInterface.swift
//  RKCooperationCore
//
//  Created by Amos on 2022/4/29.
//

import Foundation

@objc public protocol RKPointInterface: NSObjectProtocol {
    /// 频道ID
    @objc var channelId: String { get set }
    /// 发送人userId
    @objc var userId: String { get set }
    /// 消息唯一标识 uuid
    @objc var messageId: String { get set }
    /// 点位标注的颜色
    @objc var color: Int { get set }
    /// 点位标记点位
    @objc var pointF: RKPoint { get set }
    /// 宽度放大尺寸
    @objc var width: Float { get set }
    /// pointvideo MessageCode 错误码
    @objc var code: Int { get set }
    /// errorMessage 错误描述
    @objc var errorMessage: String { get set }
    /// 是否0 为视频点选，1建立连接请求， 2建立连接请求
    @objc var actionType: RKPointVideoAction { get set }

}
