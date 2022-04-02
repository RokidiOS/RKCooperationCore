//
//  RKCallListener.swift
//  RKCooperationCore
//
//  Created by Rokid on 2021/12/8.
//

import Foundation

@objc public protocol RKCallListener: NSObjectProtocol {
        
    /// 邀请发送结果回调
    /// - Parameter channelId 频道ID
    /// - Parameter userId 用户ID
    /// - Parameter result 邀请发送结果
    /// - Parameter reason 邀请失败的原因，@RKErrorCode
    @objc optional func onInviteResult(channelId: String,
                                       userId: String,
                                       result: Bool,
                                       reason: RKCooperationCode)
    
    /// 用户接受了邀请
    /// - Parameter channelId 频道ID
    /// - Parameter userId 用户ID
    @objc optional func onCallAccept(channelId: String, userId: String)
        
    /// 被呼叫的用户正忙
    /// - Parameter channelId 频道ID
    /// - Parameter userId 用户ID
    @objc optional func onCallBusy(channelId: String, userId: String)
    
    /// 被呼叫的用户拒绝了加入频道
    /// - Parameter channelId 频道ID
    /// - Parameter userId 用户ID
    @objc optional func onCallRejected(channelId: String, userId: String)
    
    /// 呼叫或加入失败了
    /// - Parameter channelId 频道ID
    /// - Parameter reason 失败的原因
    @objc optional func onError(channelId: String, reason: RKCooperationCode)
    
}

