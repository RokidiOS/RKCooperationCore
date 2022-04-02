//
//  RKUserManager.swift
//  Pods
//
//  Created by Rokid on 2021/11/10.
//

import Foundation

public class RKUserManager {
    
    public static let shared = RKUserManager()
    /// 用户token
    public var authorization: String = ""
    /// 刷新token
    public var refreshToken: String = ""
    /// 用户ID
    public var userId: String = ""
    /// token过期时间
    public var expiresTime: TimeInterval = -1
    /// 用户信息
    public var userInfo: RKUser? {
        didSet {
            userId = userInfo?.userId ?? ""
        }
    }
    /// 是否登录状态
    public static func isLogined() -> Bool {
        return RKUserManager.shared.authorization.count > 0
    }
    
    /// 用户登录
    /// - Parameters:
    ///   - companyId: 组织ID
    ///   - username: 用户名
    ///   - password: 密码
    ///   - onSuccess: 成功回调 @RKUserInfo
    ///   - onFailed: 失败回调
    public func userLogin(companyId: String,
                          username: String,
                          password: String,
                          onSuccess: @escaping RKOnSuccess,
                          onFailed: @escaping RKOnFailed) {
        var loginData: [String: String] = [:]
        loginData["appKey"] = "app"
        loginData["grantType"] = "companyUser"
        loginData["companyIndex"] = (companyId)
        loginData["deviceUserName"] = (username)
        loginData["password"] = (password)
        loginData["scope"] = "server"
        RKAPI.requestCombine(.login(data: loginData)) { responseObject in
            if responseObject.success == true {
                guard let responseData = responseObject.data as? [String: Any] else {
                    return
                }
                self.authorization = responseData["accessToken"] as? String ?? ""
                self.refreshToken = responseData["refreshToken"] as? String ?? ""
                let expiresIn: Int = responseData["expiresIn"] as? Int ?? -1
                self.expiresTime = TimeInterval(expiresIn)
                RKAPIManager.shared.token = self.authorization
                self.getUserInfo(onSuccess: onSuccess, onFailed: onFailed)
            } else {
                let errCode = RKCooperationCode(rawValue: responseObject.errorCode)?.rawValue ?? RKCooperationCode.OTHER_ERROR.rawValue
                let error = NSError(domain: responseObject.errorMsg, code: errCode, userInfo: nil)
                
                onFailed (error)
            }
        }
    }
    
    public func refreshToken(_ refreshToken: String,
                             onSuccess: @escaping RKOnSuccess,
                             onFailed: @escaping RKOnFailed) {
        var params: [String: String] = [:]
        params["appKey"] = "app"
        params["grantType"] = "refreshToken"
        params["refreshToken"] = refreshToken
        params["timestamp"] = String(Date.init().timeIntervalSince1970 * 1000)
        RKAPI.requestCombine(.refreshToken(data: params)) { responseObject in
            if responseObject.success == true {
                guard let responseData = responseObject.data as? [String: Any] else {
                    return
                }
                
                self.authorization = responseData["accessToken"] as? String ?? ""
                self.refreshToken = responseData["refreshToken"] as? String ?? ""
                let expiresIn: Int = responseData["expiresIn"] as? Int ?? -1
                self.expiresTime = TimeInterval(expiresIn)
                
                onSuccess(responseData)
                
//                self.getUserInfo(onSuccess: onSuccess, onFailed: onFailed)
            } else {
                let errCode = RKCooperationCode(rawValue: responseObject.errorCode)?.rawValue ?? RKCooperationCode.OTHER_ERROR.rawValue
                let error = NSError(domain: responseObject.errorMsg, code: errCode, userInfo: nil)
                
                onFailed (error)
            }
        }
    }
    
    /// 获取用户信息
    /// - Parameters:
    ///   - onSuccess: 成功回调
    ///   - onFailed: 失败回调
    public func getUserInfo(onSuccess: @escaping RKOnSuccess, onFailed: @escaping RKOnFailed) {
        RKAPI.requestCombine(.getUserInfo) { responseObject in
            if responseObject.success == true {
                if let data = responseObject.data as? [String: Any],
                   let userInfo = RKUser.deserialize(from: data) {
                    self.userInfo = userInfo
                    onSuccess (userInfo)
                } else {
                    let errCode = RKCooperationCode(rawValue: responseObject.errorCode)?.rawValue ?? RKCooperationCode.OTHER_ERROR.rawValue
                    let error = NSError(domain: responseObject.errorMsg, code: errCode, userInfo: nil)
                    
                    onFailed (error)
                }
            }
        }
    }
    
}
