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
    // 登录成功回调
    @objc func onLogin(reason: RKErrorCode)
    // 登出回调
    @objc func onLogout(reason: RKErrorCode)
    
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
    @objc func getShareScreenManager() -> RKShareScreenManager
    
    /// 获取AR标注管理类
    @objc func getShareSlamManager() -> RKShareSlamManager
    
    /// 获取视频点选管理类
    @objc func getSharePointManager() -> RKSharePointManager
    
    /// 获取视频控制管理类
    @objc func getVideoContrllMgr() -> RKVideoControlManager
    
    /// sdk参数配置
    @objc func initWith(params: RKCooperationCoreParams)
    
    /// sdk登录 如果已经登录过了 可以不用传用户信息
    @objc func login(company: String?,
                     userName: String?,
                     password: String?)
    /// sdk登出
    @objc func logout()
    
    /// sdk重登
    @objc func reLogin()
    
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
    
    /// 添加消息监听
    @objc func addMessage(listener: RKMsgListener)
    
    /// 移除消息监听
    @objc func removeMessage(listener: RKMsgListener)
    
}

@objcMembers
public class RKCooperationCore: NSObject {}
