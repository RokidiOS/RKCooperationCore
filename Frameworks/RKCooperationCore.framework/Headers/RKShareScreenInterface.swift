//
//  RKShareScreenInterface.swift
//  RKCooperationCore
//
//  Created by Rokid on 2022/1/14.
//

import Foundation

@objc public protocol RKShareScreenInterface: NSObjectProtocol {
    
    static var shared: RKShareScreenManager! { get }
    
    /// 开启屏幕共享
    /// - Parameter channelId: 频道ID
    @objc func startShareScreen(channelId: String)
    /// 获取屏幕共享视图
    @objc func getShareScreenVideo(renderType: RKRenderType,
                                   videoSize: RKVideoSize) -> RKVideoCanvas?
    
    /// 结束屏幕共享
    /// - Parameter channelId: 频道ID
    @objc func stopShareScreen(channelId: String)
    
}

@objcMembers
public class RKShareScreenManager: NSObject {}
