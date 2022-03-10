//
//  RKMessageInterface.swift
//  RKCooperationCore
//
//  Created by Rokid on 2022/1/14.
//

import Foundation

@objc public protocol RKMessageInterface: NSObjectProtocol {
    
    /// 添加在线消息监听
    /// - Parameters:
    ///   - listener: @ RKMsgListener
    ///   - msgType: 监听类型，需要和其他端定义
    @objc static func addMsg(listener: RKMsgListener, msgType: String?)
    
    /// 移除在线消息监听
    /// - Parameters:
    ///   - listener: @ RKMsgListener
    ///   - msgType: 监听类型，需要和其他端定义
    @objc static func removeMsg(listener: RKMsgListener, msgType: String?)
    
    /// 添加频道消息监听
    /// - Parameters:
    ///   - listener: @ RKMsgListener
    ///   - channelId: 频道ID
    ///   - msgType: 监听类型，需要和其他端定义
    @objc static func addChannelMsg(listener: RKChannelMsgListener, channelId: String, msgType: String?)
    
    /// 添加在线消息监听
    /// - Parameters:
    ///   - listener: @ RKMsgListener
    ///   - channelId: 频道ID
    ///   - msgType: 监听类型，需要和其他端定义
    @objc static func removeChannelMsg(listener: RKChannelMsgListener, channelId: String, msgType: String?)
    
    /// 发送在线消息
    /// - Parameters:
    ///   - message: 消息体
    ///   - userIds: userIds
    ///   - isSendSelf: 是否给自己模拟一条
    ///   - isExtra: 透传消息
    @objc static func sendOnlineMessage(_ message: String, to userIds: [String], isSendSelf: Bool, isExtra: Bool)
    
    /// 发送频道内消息
    /// - Parameters:
    ///   - message: 消息内容，不能为空，并且当 toUserId 不为 nil 时，content 不能大于 4k
    ///   - userIds: userIds
    ///   - isSendSelf: 是否给自己模拟一条
    ///   - isExtra: 透传消息
    @objc static func sendChannelMessage(_ message: String, to userIds: [String]?, isSendSelf: Bool, isExtra: Bool)
    
}

@objcMembers
public class RKMessageCenter: NSObject {}

