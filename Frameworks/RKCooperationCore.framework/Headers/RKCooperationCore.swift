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
        
        // 公共参数配置
        RKCooperationCoreConfig.shared.coreParams.apiHost = params.apiHost
        
        RKCooperationCoreConfig.shared.coreParams.appKey = params.appKey
        
        RKCooperationCoreConfig.shared.coreParams.token = params.token
        
        RKAPIManager.token = params.token
        
        // 初始化JC
        RKJCMideaManager.shared.initClient(appKey: params.appKey)
        // 监听来电
        RKCallManager.shared.startCallListener()
        
    }
    
    public func login(company: String?,
                      userName: String?,
                      password: String?) {
        
        if let userName = userName, let password = password, let company = company {
            RKUserManager.shared.userLogin(companyId: company,
                                           username: userName,
                                           password: password) { data in
                self.getUserInfo()
            } onFailed: { error in
                var errorCode: RKErrorCode = .OTHER_ERROR
                if let error = error,
                   let errCode = RKErrorCode(rawValue: error.code) {
                    errorCode = errCode
                }
                RKCooperationCore.getLoginListeners()?.forEach({ loginCallback in
                    loginCallback.onLogin(reason: errorCode)
                })
            }
        } else {
            getUserInfo()
        }
    }
    
    fileprivate func getUserInfo() {
        
        RKUserManager.shared.getUserInfo { userInfo in
            if let userInfo = userInfo as? RKCompanyUser {
                // 拿到UserId 登录JC
                RKJCMideaManager.shared.login(userId: userInfo.userId, password: "123456")
            } else {
                RKCooperationCore.getLoginListeners()?.forEach({ loginCallback in
                    loginCallback.onLogin(reason: .OTHER_ERROR)
                })
            }
        } onFailed: { error in
            var errorCode: RKErrorCode = .OTHER_ERROR
            if let error = error,
               let errCode = RKErrorCode(rawValue: error.code) {
                errorCode = errCode
            }
            RKCooperationCore.getLoginListeners()?.forEach({ loginCallback in
                loginCallback.onLogin(reason: errorCode)
            })
        }

    }
    
    public func logout() {
        
        RKJCMideaManager.shared.logout()
        
        RKUserManager.shared.authorization = ""
        
        RKUserManager.shared.refreshToken = ""
        
        RKUserManager.shared.expiresTime = -1
        
        RKUserManager.shared.userInfo = nil
        
    }
    
    public func reLogin() {
        
        guard RKUserManager.isLogined() else {
            return
        }
        
        RKJCMideaManager.shared.relogin(userId: RKUserManager.shared.userId,
                                        password: "123456")
    }
    
    public func destroy() {
        
        logout()
        
        RKCooperationCore._shared = nil
        
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
            
    public func addMessage(listener: RKMsgListener) {
        
        RKMessageCenter.addMsg(listener: listener, msgType: "Extra")
        
    }
    
    public func removeMessage(listener: RKMsgListener) {
        
        RKMessageCenter.removeMsg(listener: listener, msgType: "Extra")
        
    }
    
}
