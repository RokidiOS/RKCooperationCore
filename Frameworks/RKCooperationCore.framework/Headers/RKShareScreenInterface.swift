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
   
    /// 结束屏幕共享
    /// - Parameter channelId: 频道ID
    @objc func stopShareScreen(channelId: String)
    
    /// 获取屏幕共享视图  成功回调 @ RKVideoCanvas
    @objc func getShareScreenVideo(channelId: String,
                                   renderType: RKRenderType,
                                   videoSize: RKVideoSize,
                                   onSuccess: RKOnSuccess?,
                                   onFailed: RKOnFailed?)
}

@objcMembers
public class RKShareScreenManager: NSObject {}
