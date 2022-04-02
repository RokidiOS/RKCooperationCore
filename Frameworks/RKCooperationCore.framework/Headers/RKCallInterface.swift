//
//  RKCallInterface.swift
//  RKCooperationCore
//
//  Created by Rokid on 2021/12/8.
//

import Foundation

@objc public protocol RKCallInterface: NSObjectProtocol {
    
    static var shared: RKCallManager! { get }
    
    
    /// 创建频道
    ///  - Parameters:
    ///  - userIds:  邀请的用户ID列表
    ///  - resolutionRatio:  分辨率
    ///  - channelName: 频道名称
    ///  - password: 频道密码
    ///  - onSuccess: 成功回调
    ///  - onFailed: 失败回调
    @objc func createChannel(_ thirdChannelId: String?,
                             userIds:[String]?,
                             resolutionRatio: RKResolution,
                             channelName: String,
                             password: String?,
                             onSuccess:@escaping RKOnSuccess,
                             onFailed:@escaping RKOnFailed)
    
    /// 邀请加入频道，对方将收到 RKIncomingCallListener.onReceiveCall
    /// - Parameters:
    ///  - channelId: 频道ID
    ///  - userIdList:  邀请的用户ID列表
    @objc func invite(channelId: String,
                      userIdList: [String])
    
    /// 取消邀请，在对方进入会议之前有效，呼叫方将收到 RKCallListener.onCallCancel
    /// - Parameter channelId 频道ID
    @objc func cancel(channelId: String)
    
    /// 接听，直接加入频道
    /// - Parameter channelId 频道ID
    @objc func accept(channelId: String)

    /// 挂断，拒绝加入频道
    /// - Parameter channelId 拒绝的频道ID
    @objc func reject(channelId: String)
    
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

