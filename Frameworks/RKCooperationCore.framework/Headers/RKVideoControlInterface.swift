//
//  RKVideoControlInterface.swift
//  RKCooperationCore
//
//  Created by Rokid on 2022/1/14.
//

import Foundation

@objc public protocol RKVideoControlInterface: NSObjectProtocol {
    
    static var shared: RKVideoControlManager! { get }
    
    @objc func msgJson(_ message: RKMessage) -> String
    
    /// 请求控制
    @objc func startVideoControll(_ messageBlock:((_ message: RKVideoControlMessage) -> Void))
    
    /// 控制建立回调
    @objc func establish(_ messageBlock:((_ message: RKVideoControlMessage) -> Void), isSendSelf: Bool)
    
    /// 断开连接
    @objc func stopVideoControll(_ messageBlock:(_ message: RKVideoControlMessage) -> Void)
    
    /// 发送控制消息
    @objc func sendMessage(_ messageBlock:(_ message: RKVideoControlMessage) -> Void)
    
}

@objcMembers
public class RKVideoControlManager: NSObject {}
