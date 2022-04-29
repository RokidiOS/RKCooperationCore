//
//  RKChannelMsgListener.swift
//  Pods
//
//  Created by Rokid on 2021/12/2.
//

import Foundation

@objc public protocol RKChannelMsgListener: NSObjectProtocol {
    /// 收到频道内消息  content @ RKMessage
    @objc func onChannelMsgReceive(fromUserId: String, content: String)
}

