//
//  RKDeviceListener.swift
//  Pods
//
//  Created by Rokid on 2021/12/2.
//

import Foundation

@objc public protocol RKDeviceListener: NSObjectProtocol {
    
    /// 摄像头发生变化
    @objc func onCameraUpdate()
    
    /// 音频输出变更
    @objc func onAudioOutputTypeChange(audioType: RKAudioOutputType)
    
    /// 音频输出状态发生改变
    /// - Parameter audioOutput 音频正在输出，false: 音频已停止输出
    @objc func onAudioOutputStateChanged(audioOutput: Bool)
    
    /// 上传本地视频状态发生改变
    /// - Parameter uploadLocalVideo true: 正在上传，false: 已停止上传
    @objc func onUploadVideoStateChanged(uploadLocalVideo: Bool)
    
    /// 上传本地音频状态发生改变
    /// - Parameter uploadLocalAudio true: 正在上传，false: 已停止上传
    @objc func onUploadAudioStateChanged(uploadLocalAudio: Bool)
            
    // 本端音频参数回调
    @objc optional func onAudioStatus(audioLevel: Double,
                             totalAudioEnergy: Double,
                             totalSamplesDuration: Double)
    
    
    // 本端视频参数回调
    @objc optional func onVideoRecordStatus(width: Int32,
                                   height: Int32,
                                   fps: Int32)
    
    // 本端视频参数回调
    @objc optional func onVideoPublishStatus(rid: String?,
                                    width: Int32,
                                    height: Int32,
                                    fps: Int32,
                                    bitrate: Int32,
                                    qualityLimitationReason: String?)
}
