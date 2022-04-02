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
    @objc static func addChannelMsg(listener: RKChannelMessageListener, channelId: String)
    
    /// 添加在线消息监听
    /// - Parameters:
    ///   - listener: @ RKChannelMessageListener
    ///   - channelId: 频道ID
    @objc static func removeChannelMsg(listener: RKChannelMessageListener, channelId: String)
    
    /// 发送频道内消息
    /// - Parameter message: 消息内容，不能为空，并且当 toUserId 不为 nil 时，content 不能大于 4k
    @objc static func sendChannelMessage(_ message: String)
    
}

@objcMembers
public class RKMessageCenter: NSObject {}

