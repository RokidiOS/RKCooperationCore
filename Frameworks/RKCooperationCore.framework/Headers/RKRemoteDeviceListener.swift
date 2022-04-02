//
//  RKRemoteDeviceListener.swift
//  Pods
//
//  Created by Rokid on 2021/12/2.
//

import Foundation

@objc public protocol RKRemoteDeviceListener {
    
    /// 用户音频上传状态发生改变
    /// - Parameters:
    ///  - userId: 发生改变的用户ID
    ///  - enabled: true: 上传中，false: 停止上传
    @objc optional func onUserUploadAudioChanged(userId: String, enabled: Bool)
    
    /// 用户视频上传状态发生改变
    /// - Parameters:
    ///  - userId: 发生改变的用户ID
    ///  - enabled: true: 上传中，false: 停止上传
    @objc optional func onUserUploadVideoChanged(userId: String, enabled: Bool)
    
    /// 用户网络连接状态改变
    /// - Parameters:
    ///  - userId: 用户ID
    ///  - status: netStatus @ RKNetStatus
    @objc optional func onUserNetStatusChanged(userId: String, netStatus: RKNetStatus)
    
    /// 用户上传视频大小发生改变
    /// - Parameters:
    ///  - userId: 用户ID
    ///  - videoSize: @ RKVideoSize
    @objc optional func onUserVideoSizeChanged(userId: String, videoSize: RKVideoSize)
    
    /// 频道内成员音量变化
    /// - Parameters:
    ///  - userId: 用户ID
    ///  - status: 当前音量状态，@RKVolumeStatus
    @objc optional func onUserVolumeChange(userId: String, status: RKVolumeStatus)
    
}
