//
//  RKCooperationCoreProtocol.swift
//  Pods
//
//  Created by Rokid on 2021/11/17.
//

import Foundation
/// 成功回调
public typealias RKOnSuccess = (_ data: Any?) -> Void
/// 失败回调
public typealias RKOnFailed = (_ error: NSError?) -> Void

// MARK: - 登录状态回调
@objc public protocol RKLoginCallback: NSObjectProtocol {
    
    // 登录结果回调
    @objc func onLogin(reason: RKCooperationCode)
    // 登出回调
    @objc func onLogout(reason: RKCooperationCode)
    /// 登录回调用户已经加入的频道
    @objc func onJoinedChannelList(_ channelList: [RKIJoinedChannel]?)
}

// MARK: - sdk回调
@objc public protocol RKCooperationInterface: NSObjectProtocol {
    
    /// sdk管理类
    static var shared: RKCooperationCore! { get }
    
    /// 获取呼叫管理类
    @objc func getCallManager() -> RKCallManager
    
    /// 获取频道管理类
    @objc func getChannelManager() -> RKChannelManager
    
    /// 获取涂鸦管理类
    @objc func getShareDoodleManager() -> RKShareDoodleManager
    
    /// 获取屏幕共享管理类
    @objc func getShareScreenManager() -> RKShareScreenManager; @available(iOS 11.0, *)
    
    /// 获取视频点选管理类
    @objc func getSharePointManager() -> RKSharePointManager
    
    /// sdk参数配置
    @objc func initWith(params: RKCooperationCoreParams)
    
    /// sdk登录 token登录
    @objc func login(with token: String, userInfo: RKUser)
    
    /// 更新token，外部更新token，在token失效之前更新
    @objc func updateToken(_ token: String)
    
    /// sdk登出
    @objc func logout()
    
    /// sdk销毁
    @objc func destroy()
    
    /// 添加登录状态监听
    @objc func addLogin(listener: RKLoginCallback)
    
    /// 移除登录状态监听
    @objc func removeLogin(listener: RKLoginCallback)
    
    /// 添加来电监听
    @objc func addIncomingCall(listener: RKIncomingCallListener)
    
    /// 移除来电监听
    @objc func removeIncomingCall(listener: RKIncomingCallListener)
    
    /// 添加呼叫监听
    @objc func addCall(listener: RKCallListener)
    
    /// 移除呼叫监听
    @objc func removeCall(listener: RKCallListener)
    
}

@objcMembers
public class RKCooperationCore: NSObject {}
