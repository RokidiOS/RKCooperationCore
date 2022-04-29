//
//  RKCallInterface.swift
//  RKCooperationCore
//
//  Created by Rokid on 2021/12/8.
//

import Foundation

@objc public protocol RKCallInterface: NSObjectProtocol {
    
    static var shared: RKCallManager! { get }
    
    /// 邀请加入频道，对方将收到 RKIncomingCallListener.onReceiveCall
    /// 注意：调用该接口需要确保自己已加入且在该channel中！
    /// - Parameters:
    ///  - channelId: 频道ID
    ///  - userIdList:  邀请的用户ID列表
    ///  - onSuccess:  data 返回重复邀请的用户ID
    @objc func invite(channelId: String,
                      userIdList: [String], onSuccess: RKOnSuccess?, onfailed: RKOnFailed?)
    
    /// 取消邀请，在对方进入会议之前有效，被叫方将收到
    /// RKCallListener.onCallCancel
    /// - Parameter channelId 频道ID
    @objc func cancel(channelId: String, onSuccess: RKOnSuccess?, onfailed: RKOnFailed?)
    
    /// 接听，直接加入频道, 内部会自动join，不需要再调用join
    /// - Parameter channelId 频道ID
    @objc func accept(channelId: String, onSuccess: RKOnSuccess?, onfailed: RKOnFailed?)

    /// 挂断，拒绝加入频道, 呼叫方会收到
    /// RKCallListener.onCallBusy  被呼叫方加入频道
    /// - Parameter channelId 拒绝的频道ID
    @objc func reject(channelId: String, onSuccess: RKOnSuccess?, onfailed: RKOnFailed?)
    
    /// 繁忙，拒绝加入频道，呼叫方会收到
    /// RKCallListener.onCallBusy 被叫方繁忙
    /// - Parameter channelId 拒绝的频道ID
    @objc func busy(channelId: String, onSuccess: RKOnSuccess?, onfailed: RKOnFailed?)
    
    /// 设置呼叫监听
    /// - Parameter listener: @RKCallListener
    @objc func addCallState(listener: RKCallListener)
    
    /// 移除呼叫监听
    /// - Parameter listener: @RKCallListener
    @objc func removeCallState(listener: RKCallListener)
    
    /// 移除来电监听
    /// - Parameter listener: @RKIncomingCallListener
    @objc func addIncomingCall(listener: RKIncomingCallListener)
    
    /// 移除来电监听
    /// - Parameter listener: @RKIncomingCallListener
    @objc func removeIncomingCall(listener: RKIncomingCallListener)
    
}

@objcMembers
public class RKCallManager: NSObject {}

