//
//  RKMessageInterface.swift
//  RKCooperationCore
//
//  Created by Rokid on 2022/1/14.
//

import Foundation

@objc public protocol RKMessageInterface: NSObjectProtocol {
    
    /// 添加频道消息监听
    /// - Parameters:
    ///   - listener: @ RKChannelMessageListener
    ///   - channelId: 频道ID
    @objc static func addChannelMsg(listener: RKChannelMsgListener, channelId: String)
    
    /// 添加在线消息监听
    /// - Parameters:
    ///   - listener: @ RKChannelMessageListener
    ///   - channelId: 频道ID
    @objc static func removeChannelMsg(listener: RKChannelMsgListener, channelId: String)
    
    /// 发送频道内消息，频道内所有用户将收到消息，自己也会收到
    /// - Parameter message: 消息内容，不能为空！
    @objc static func sendChannelMessage(_ message: String)
    
    /// 指定用户发送消息
    /// - Parameters:
    ///   - message: 消息内容，不能为空！
    ///   - userIdList: 需要发送的用户
    @objc static func sendChannelMessage(_ message: String, userIdList: [String])
    
}

@objcMembers
public class RKMessageCenter: NSObject {}

