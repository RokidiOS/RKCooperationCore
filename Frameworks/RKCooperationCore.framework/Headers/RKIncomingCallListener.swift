//
//  RKIncomingCallListener.swift
//  RKCooperationCore
//
//  Created by Rokid on 2021/12/14.
//

import Foundation

@objc public protocol RKIncomingCallListener: NSObjectProtocol {
    
    /// 收到来电
    /// - Parameter channelId 频道ID
    /// - Parameter fromUserId 来电用户ID
    /// - Parameter createTime 创建时间
    @objc optional func onReceiveCall(channelId: String,
                                      fromUserId: String,
                                      createTime: Int64)
    
}

