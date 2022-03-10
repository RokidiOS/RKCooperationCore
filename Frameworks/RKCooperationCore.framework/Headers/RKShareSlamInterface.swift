//
//  RKShareSlamInterface.swift
//  RKCooperationCore
//
//  Created by Rokid on 2022/1/14.
//

import Foundation

@objc public protocol RKShareSlamInterface: NSObjectProtocol {
    
    static var shared: RKShareSlamManager! { get }
    
    /// 发起AR标注
    /// - Parameters:
    ///   - channelId: 频道ID
    ///   - userId: 对方userID
    @objc func inviteShareSlam(channelId: String, userId: String)
    
    /// 结束AR标注
    /// - Parameter - channelId: 频道ID
    @objc func stopInviteShareSlam(channelId: String)
    
    ///  发送slam消息
    /// - Parameters:
    ///   - channelId: 频道ID
    ///   - doodle: doodle
    @objc func send(channelId: String, slamMessage: RKSlamBaseMessage)
    
    /// 撤销一笔
    /// - Parameters:
    ///   - channelId: 频道ID
    ///   - doodle: doodle
    @objc func revoke(channelId: String)
    
    /// 清除标注
    /// - Parameter channelId: 频道ID
    @objc func clear(channelId: String)
    
}

@objcMembers
public class RKShareSlamManager: NSObject {}
