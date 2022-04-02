//
//  RKShareListener.swift
//  RKCooperationCore
//
//  Created by Rokid on 2021/12/16.
//

import Foundation

// MARK: - 频道内霸屏功能回调

@objc
public enum RKShareErrorCode: Int {
    /// 已经存在共享了
    case EXIST_SHARE = -1
    /// 其他异常
    case OTHER_ERROR = 199
}

@objc public protocol RKShareListener: NSObjectProtocol {
    
    /// 有人发起了屏幕共享
    /// - Parameter userId  对方userId
    @objc optional func onStartShareScreen(userId: String)
    
    /// 有人结束了屏幕共享
    /// - Parameter userId  对方userId
    @objc optional func onStopShareScreen(userId: String)
    
    /// 有人发起了白板标注
    /// - Parameter userId  对方userId
    @objc optional func onStartShareDoodle(userId: String)
    
    /// 有人结束了白板标注
    /// - Parameter userId  对方userId
    @objc optional func onStopShareDoodle(userId: String)
    
    /// 有人发起了截图标注
    /// - Parameters:
    ///  - userId:  对方userId
    ///  - imgUrl: 对方截图地址
    @objc optional func onStartShareImageDoodle(userId: String, imgUrl: String)
    
    /// 有人结束了截图标注
    /// - Parameter userId  对方userId
    @objc optional func onStopShareImageDoodle(userId: String)
    
    /// 有人发起了AR标注
    /// - Parameters:
    ///  - userId:  发起者userId
    ///  - executorUserId:  执行者userId
    @objc optional func onStartShareSlam(userId: String, executorUserId: String)
    
    /// 有人结束了AR标注
    /// - Parameter userId  对方userId
    @objc optional func onStopShareSlam(userId: String)
    
    /// 有人发起了视频点选
    /// - Parameters:
    ///  - userId:  发起者userId
    ///  - executorUserId:  执行者userId
    @objc optional func onStartSharePointVideo(userId: String, executorUserId: String)
    
    /// 有人结束了结束视频点选
    /// - Parameter userId  对方userId
    @objc optional func onStopSharePointVideo(userId: String)
    
    /// 收到视频点选消息
    /// - Parameter message @ RKPointVideoMessage
    @objc optional func onPointVideo(message: RKPointVideoMessage)
    
    /// 收到视频控制消息
    /// - Parameter message @ RKVideoControlMessage
    @objc optional func onVideoControl(message: RKVideoControlMessage)
    
    /// 收到Doodle消息
    /// - Parameter message @ RKDoodle
    @objc optional func onDoodle(message: RKDoodle)
    
    /// 收到Slam标注消息
    /// - Parameter message @ RKSlamBaseMessage
    @objc optional func onSlam(message: RKSlamBaseMessage)
    
    /// 共享异常处理
    /// - Parameter code 错误码 @ RKShareErrorCode
    @objc optional func onShareError(code: RKShareErrorCode)
    
}
