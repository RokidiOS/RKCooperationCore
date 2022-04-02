//
//  RKChannelListener.swift
//  Pods
//
//  Created by Rokid on 2021/12/2.
//

import Foundation

@objc public protocol RKChannelListener: NSObjectProtocol {
    
    /// 频道创建回调
    /// - Parameter channelId 频道ID
    /// - Parameter channel @RKChannel
    @objc optional func onChannelCreated(channelId:String, channel: RKChannel)
    
    /// 加入频道的结果回调
    /// - Parameters:
    ///  - channelId: 要加入的频道ID
    ///  - result: 加入的结果，true: 成功加入，false: 加入失败
    ///  - reason: 加入失败的原因，@ RKErrorCode
    @objc func onJoinChannelResult(channelId: String, result: Bool, reason: RKCooperationCode)
    
    /// 屏幕共享状态发生改变
    /// - Parameter screenUserId 不为空则有成员正在共享屏幕，否则值为null
    @objc func onUserScreenShareStateChanged(screenUserId: String?)
    
    /// 离开频道的回调
    /// - Parameters:
    ///  - channelId: 离开的频道ID
    ///  - reason: 离开频道的调用结果，@ RKErrorCode
    @objc func onLeave(channelId: String?, reason: RKCooperationCode)
    
    /// 频道内用户被踢出频道
    /// - Parameters:
    ///  - channelId: 离开的频道ID
    ///  - userIds: 被踢出的用户列表
    @objc optional func onUserKicked(channelId: String?, userIds: [String])
    
    /// 自己被踢出频道
    /// - Parameters:
    ///  - channelId: 离开的频道ID
    ///  - byUserId: 踢出自己的用户
    @objc func onKicked(channelId: String?, byUserId: String)
    
    /// 频道关闭
    @objc func onDispose()

    /// 频道状态发生变更
    /// - Parameters:
    ///  - newState: 当前状态，@ RKChannelState
    ///  - oldState: 上一个状态，@ RKChannelState
    @objc func onChannelStateChanged(newState: RKChannelState, oldState: RKChannelState)
    
    /// 自定义频道属性发生了改变
    /// - Parameter customProperty 改变后的属性值
    @objc func onCustomPropertyChanged(customProperty: String?)
    
    /// 录制状态发生改变
    /// - Parameter recordState 当前的录制状态，@ RKRecordState
    @objc func onRecordStateChanged(recordState: RKRecordState)
    
    /// 有成员加入频道
    /// - Parameters:
    ///  - channelId: 频道ID
    ///  - userId: 加入的成员用户ID
    @objc func onUserJoinChannel(channelId: String, userId: String)
    
    /// 频道内成员离开
    /// - Parameters:
    ///  - channelId: 频道ID
    ///  - userId: 离开的成员用户ID
    @objc func onUserLeaveChannel(channelId: String?, userId: String?)
    
    /// 频道内共享状态回调
    /// - Parameters:
    ///  - channelId: 频道ID
    ///  - shareType: 分享类型 @RKShareType
    @objc func onChannelShare(channelId: String?, shareType: RKShareType)
    
}
