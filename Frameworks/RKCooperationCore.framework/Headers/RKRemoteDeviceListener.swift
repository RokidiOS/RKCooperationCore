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
    
    /// 远端音频参数回调
    /// - Parameters:
    ///  - userId: 用户ID
    ///  - audioLevel: 音频等级
    ///  - totalAudioEnergy: 总音频能量
    ///  - totalSamplesDuration: 统计时长
    ///  - packetsLost: 丢包数
    @objc optional func onRemoteAudioStatus(_ userId: String,
                                            audioLevel: Double,
                                            totalAudioEnergy: Double,
                                            totalSamplesDuration: Double,
                                            packetsLost: Int32)
    
    /// 远端视频参数回调
    /// - Parameters:
    ///  - userId: 用户ID
    ///  - rid: 标记大小流，大流：h，小流：l
    ///  - width: 视频宽
    ///  - height: 视频高
    ///  - fps: 帧率
    ///  - bitrate: 码率 kbps
    ///  - packetsLost: 丢包数
    @objc optional func onRemoteVideoStatus(_ userId: String,
                                            rid: String?,
                                            width: Int32,
                                            height: Int32,
                                            fps: Int32,
                                            bitrate: Int32,
                                            packetsLost: Int32)
    
    /// 远端丢包率参数回调
    /// - Parameters:
    ///  - userId: 用户ID
    ///  - lossRate: 丢包率 float: 0-1
    @objc optional func onVideoStreamUnstable(userId: String, lossRate: Float)
    
}
