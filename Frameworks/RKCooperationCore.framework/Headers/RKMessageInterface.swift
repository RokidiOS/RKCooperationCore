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
    
    /// 发送频道内消息，不支持指定用户发送消息，调用此方法将给当前频道内所有成员发送消息，自己也会收到该消息
    /// - Parameter message: 消息内容，不能为空！
    @objc static func sendChannelMessage(_ message: String)
    
}

@objcMembers
public class RKMessageCenter: NSObject {}

