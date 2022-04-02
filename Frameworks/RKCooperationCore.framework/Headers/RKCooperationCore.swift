//
//  RKCooperationCore.swift
//  Pods
//
//  Created by Rokid on 2021/11/10.
//

import Foundation
import CoreMedia

extension RKCooperationCore: RKCooperationInterface {
    
    fileprivate static var _shared: RKCooperationCore?
    
    public static var shared: RKCooperationCore! {
        
        guard let shared = _shared else {
            _shared = RKCooperationCore()
            return _shared!
        }
        return shared
        
    }
    
    static var loginListeners: NSHashTable = NSHashTable<AnyObject>(options: .weakMemory)
    
    // MARK: - 内部方法
    
    static func getLoginListeners() -> [RKLoginCallback]? {
        
        let list: [AnyObject]? = RKCooperationCore.loginListeners.allObjects
        var results: [RKLoginCallback] = []
        for loginProtocol in list ?? [] {
            if let loginProtocol = loginProtocol as? RKLoginCallback {
                results.append(loginProtocol)
            }
        }
        return results
        
    }
    
    public func getCallManager() -> RKCallManager {
        
        return RKCallManager.shared
        
    }
    
    public func getChannelManager() -> RKChannelManager {
        
        return RKChannelManager.shared
        
    }
    
    public func getShareDoodleManager() -> RKShareDoodleManager {
        
        return RKShareDoodleManager.shared
        
    }
    
    public func getShareScreenManager() -> RKShareScreenManager {
        
        return RKShareScreenManager.shared
        
    }
    
    public func getShareSlamManager() -> RKShareSlamManager {
        
        return RKShareSlamManager.shared
        
    }
    
    public func getSharePointManager() -> RKSharePointManager {
        
        return RKSharePointManager.shared
        
    }
    
    public func getVideoContrllMgr() -> RKVideoControlManager {
        
        return RKVideoControlManager.shared
        
    }
    
    public func initWith(params: RKCooperationCoreParams) {
        
        assert(params.saasUrl.isEmpty == false, "params saasUrl 不能为空！")
        
        assert(params.rtcUrl.isEmpty == false, "params rtcUrl 不能为空！")
        
        assert(params.wssUrl.isEmpty == false, "params wssUrl 不能为空！")
        
        // 公共参数配置
        RKCooperationCoreConfig.shared.coreParams = params
        
        // rtc 初始化
        RKRTCManager.shared.initClient(appKey: params.appKey)
    }
    
    public func login(with token: String, userInfo: RKCompanyUser) {
        
        assert(token.isEmpty == false, "token 不能为空！")
        
        assert(userInfo.userId.isEmpty == false, "userInfo.userId 不能为空！")
        // 配置用户信息
        RKUserManager.shared.userInfo = userInfo
        /// 配置全局token
        RKAPIManager.shared.token = token
        /// rtc 登录
        rtcLogin()
    }
    
    func login(with company: String, userName: String, password: String) {
        
        assert(company.isEmpty == false, "company 不能为空！")
        assert(userName.isEmpty == false, "userName 不能为空！")
        assert(password.isEmpty == false, "password 不能为空！")
        
        RKUserManager.shared.userLogin(companyId: company,
                                       username: userName,
                                       password: password) { data in
            if RKUserManager.shared.authorization.isEmpty == false {
                /// 配置全局token
                RKAPIManager.shared.token = RKUserManager.shared.authorization
                /// rtc 登录
                self.rtcLogin()
            } else {
                RKCooperationCore.getLoginListeners()?.forEach({ loginCallback in
                    loginCallback.onLogin(reason: .OTHER_ERROR)
                })
            }
        } onFailed: { error in
            var errorCode: RKCooperationCode = .OTHER_ERROR
            if let error = error,
               let errCode = RKCooperationCode(rawValue: error.code) {
                errorCode = errCode
            }
            RKCooperationCore.getLoginListeners()?.forEach({ loginCallback in
                loginCallback.onLogin(reason: errorCode)
            })
        }
    }
    
    public func logout() {
        
        RKRTCManager.shared.logout()
        
        RKUserManager.shared.authorization = ""
        
        RKUserManager.shared.refreshToken = ""
        
        RKUserManager.shared.expiresTime = -1
        
        RKUserManager.shared.userInfo = nil
        
    }
    
    public func destroy() {
        
        logout()
        
        RKCooperationCoreConfig.shared.coreParams = nil
        
        RKCooperationCore._shared = nil
        
        RKRTCManager.shared.dispose()
    }
    
    public func addLogin(listener: RKLoginCallback) {
        
        RKCooperationCore.loginListeners.add(listener)
        
    }
    
    public func removeLogin(listener: RKLoginCallback) {
        
        RKCooperationCore.loginListeners.remove(listener)
        
    }
    
    public func addIncomingCall(listener: RKIncomingCallListener) {
        
        RKCallManager.shared.addIncomingCall(listener: listener)
        
    }
    
    public func removeIncomingCall(listener: RKIncomingCallListener) {
        
        RKCallManager.shared.removeIncomingCall(listener: listener)
        
    }
    
    public func addCall(listener: RKCallListener) {
        
        RKCallManager.shared.addCallState(listener: listener)
        
    }
    
    public func removeCall(listener: RKCallListener) {
        
        RKCallManager.shared.removeCallState(listener: listener)
        
    }
}

// MARK: - Private

extension RKCooperationCore {
    
    /// rtc 登录
    fileprivate func rtcLogin() {
        
        guard let userInfo = RKUserManager.shared.userInfo else {
            RKCooperationCore.getLoginListeners()?.forEach({ loginCallback in
                loginCallback.onLogin(reason: .PARAMS_ERROR)
            })
            return
        }
        
        // 配置rtc
        RKRTCManager.shared.login(with: RKCooperationCoreConfig.shared.coreParams!.rtcUrl,
                                  wssUrl: RKCooperationCoreConfig.shared.coreParams!.wssUrl,
                                  userId: userInfo.userId,
                                  token: RKAPIManager.shared.token) { data in
            // 监听来电
            RKCallManager.shared.startCallListener()
            // 回调登录成功
            RKCooperationCore.getLoginListeners()?.forEach({ loginCallback in
                loginCallback.onLogin(reason: .OK)
            })
        } onFailed: { error in
            let code = RKCooperationCode(rawValue: error?.code ?? RKCooperationCode.OTHER_ERROR.rawValue)
            RKCooperationCore.getLoginListeners()?.forEach({ loginCallback in
                loginCallback.onLogin(reason: code ?? .OTHER_ERROR)
            })
        }
    }
}
