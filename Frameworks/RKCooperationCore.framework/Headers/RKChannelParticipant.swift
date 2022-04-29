//
//  RKChannelParticipant.swift
//  Pods
//
//  Created by Rokid on 2021/12/2.
//

import Foundation
import RKILogger

@objcMembers
public class RKChannelParticipant: NSObject {
    // 频道ID
    public var channelId: String = ""
    // 用户ID
    public var userId: String = ""
    // 名字
    public var displayName: String?
    // 用户的网络状态
    public var netStatus: RKNetStatus = .NORMAL
    // 查询该用户的音量状态
    public var volumeStatus: RKVolumeStatus = .NONE
    // 用户上传视频大小
    public var videoSize: RKVideoSize = .SIZE_MAX
    // 是否是频道创建者
    public var isCreator: Bool = false
    // 是否是自己
    public var isSelf: Bool = false
    // 查询用户是否上传音频
    public var isAudioStart: Bool = false
    // 查询用户是否上传视频
    public var isVideoStart: Bool = false
    // 视频流
    public var videoCanvas: RKVideoCanvas?
    // 用户信息
    public var companyUser: RKUser?
  
}

extension RKChannelParticipant {
    
    // 拉取视频流
    public func startVideo(renderType: RKRenderType, videoSize: RKVideoSize,_ compeletBlock:@escaping (RKVideoCanvas?) ->Void) {
        DispatchQueue.main.async {
            if self.isSelf {
               let canvs = RKRTCManager.shared.startLocalVideo(self, renderType: renderType)
                compeletBlock(canvs)
            } else {
                RKRTCManager.shared.startRemoteVideo(self, renderType: renderType, in: nil) { canvas in
                    self.videoCanvas = canvas
                    compeletBlock(canvas)
                }
            }
        }
      
    }
    
}
