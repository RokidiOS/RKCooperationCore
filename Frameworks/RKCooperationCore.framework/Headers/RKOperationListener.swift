//
//  RKOperationListener.swift
//  Pods
//
//  Created by Rokid on 2021/12/2.
//

import Foundation

@objc public protocol RKOperationListener {
    
    /// 查询频道状态回调
    /// - Parameters:
    ///  - channelId: 要加入的频道ID
    ///  - result: 查询结果，true: 成功加入，false: 加入失败
    ///  - reason: 失败原因，@ RKErrorCode
    @objc func onQuery(_ channelId: String, result: Bool, reason: RKCooperationCode)
    
}
