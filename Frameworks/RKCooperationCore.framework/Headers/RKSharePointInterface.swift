//
//  RKSharePointInterface.swift
//  RKCooperationCore
//
//  Created by Rokid on 2022/1/14.
//

import Foundation

@objc public protocol RKSharePointInterface: NSObjectProtocol {
    
    static var shared: RKSharePointManager! { get }
    
    /// 结束自己发起的视频点选
    /// - Parameter channelId: 频道ID
    @objc func stopSharePointVideo(channelId: String)
    
    /// 邀请别人发起视频点选
    /// - Parameters:
    ///   - channelId: 频道ID
    ///   - userId: 对方userID
    @objc func inviteSharePointVideo(channelId: String, userId: String)
    
    /// 发送视频点选消息
    @objc func sendPoint(channelId: String, slamColor: Int, markPoint: RKPoint, pointWidth: Float)
    
}

@objcMembers
public class RKSharePointManager: NSObject {}
