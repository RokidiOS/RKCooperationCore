//
//  RKCallInterface.swift
//  RKCooperationCore
//
//  Created by Rokid on 2021/12/8.
//

import Foundation

@objc public protocol RKCallInterface: NSObjectProtocol {
    
    static var shared: RKCallManager! { get }
    
    /// 邀请加入频道 对方将收到 RKIncomingCallListener.onReceiveCall
    /// - Parameters:
    ///  - channelId: 频道ID
    ///  - userIdList:  邀请的用户ID列表
    ///  - channelTitle: 邀请的用户ID列表
    ///  - channelParam:  频道参数
    @objc func invite(channelId: String,
                      userIdList: [String],
                      channelTitle: String?,
                      channelParam: RKChannelParam?)
    
    /// 取消呼叫，呼叫方将收到 RKCallListener.onCallCancel
    /// - Parameter channelId 频道ID
    @objc func cancel(channelId: String)
    
    /// 接听
    /// - Parameter channelId 频道ID
    @objc func accept(channelId: String)
    
    /// 拒绝加入频道、原因是正在其他频道忙(同时只能加入一个频道) 对方将收到 RKCallListener.onCallBusy
    /// - Parameter channelId 频道ID
    @objc func busy(channelId: String)
    
    /// 主动拒绝加入频道
    /// - Parameter对方将收到 RKCallListener.onCallRejected
    /// - Parameter channelId 拒绝的频道ID
    @objc func reject(channelId: String)
    
    /// 设置呼叫监听
    /// - Parameter listener: @RKCallListener
    @objc func addCallState(listener: RKCallListener)
    
    /// 设置呼叫监听
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

