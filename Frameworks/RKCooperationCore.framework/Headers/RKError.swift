//
//  RKError.swift
//  Pods
//
//  Created by Rokid on 2021/11/17.
//

import Foundation

public struct RKError: Error {
    
}

@objc
public enum RKCooperationCode: Int {
    
    /// 正常
    case OK = 0
    /// SDK未初始化
    case SDK_NOT_INIT = 1
    /// 异常参数
    case INVALID_PARAM = 2
    /// 网络异常
    case NETWORK_ERROR = 3
    /// AppKey错误
    case APP_KEY_ERROR = 4
    /// 账号密码错误
    case AUTH_ERROR = 5
    /// 用户不存在
    case NO_SUCH_USER = 6
    /// 强制登出
    case SERVER_LOGOUT = 7
    /// 用户在其他设备登录
    case LOGIN_ON_OTHER_DEVICE = 8
    /// 发送消息失败了
    case SEND_MESSAGE_FAILED = 9
    /// 服务器忙
    case SERVER_BUSY = 10
    /// 无法连接服务器
    case SERVER_CAN_NOT_REACH = 11
    /// 服务器拒绝
    case SERVER_FORBIDDEN = 12
    /// 服务器不可用
    case SERVER_UNAVAILABLE = 13
    /// 查询DNS异常
    case QUERY_DNS_ERROR = 14
    /// 服务器内部错误
    case SERVER_INTERNAL_ERROR = 15
    /// token与账号不匹配
    case TOKEN_ACCOUNTID_MISMATCH = 16
    /// 超时
    case TIMEOUT = 17
    /// 已加入该频道
    case ALREADY_JOINED_CAHNNEL = 18
    /// 被踢出频道
    case KICKED_OUT = 19
    /// 掉线
    case OFFLINE = 20
    /// 频道已经被关闭
    case CHANNEL_OVER = 21
    /// 频道已经满员
    case CHANNEL_FULL = 22
    /// 频道异常
    case CHANNEL_INTERNAL_ERROR = 23
    /// token过期了
    case TOKEN_EXPIRED = 24
    /// 存在已加入频道，需要先退出频道再加入新的频道
    case JOIN_BEFORE_LEAVE = 101
    /// 加入频道失败，其他异常
    case JOIN_UNKNOWN_ERROR = 102
    /// 请求加入频道但是未登录
    case JOIN_NOT_LOGIN = 103
    /// 主动退出频道
    case SELF_QUIT = 104
    /// 频道密码错误
    case CHANNEL_PASSWORD_ERROR = 105
    /// 参数异常
    case PARAMS_ERROR = 198
    /// 其他异常
    case OTHER_ERROR = 199
}
