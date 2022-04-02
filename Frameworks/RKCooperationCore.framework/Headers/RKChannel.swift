//
//  RKChannel.swift
//  Pods
//
//  Created by Rokid on 2021/12/2.
//

import Foundation
import RKILogger

@objcMembers
public class RKChannel: NSObject {
    
    // 频道ID
    public var channelId: String = ""
    
    public var channelName: String = ""
    // 频道内成员
    public var participants: [RKChannelParticipant] = []
    // 频道对应的共享信息
    public var shareInfo: RKShareInfo?
    // 频道参数
    public var channelParam = RKChannelParam()
    // 录制参数
    public var recordParams: RKRemoteRecordParams?
    // 自己
    public var participantSelf: RKChannelParticipant? {
        get {
            guard let participant = participants.first(where: { $0.isSelf }) else {
                return nil
            }
            return participant
        }
    }
    // 频道内成员ID
    public var userIds: [String]! {
        get {
            var userIds: [String] = []
            participants.forEach { part in
                userIds.append(part.userId)
            }
            return userIds
        }
    }
    
    public func memberFrom(userId: String) -> RKUser? {
        participants.first(where: {$0.userId == userId})?.companyUser
    }
    
    public override init() {
        
        super.init()
        
    }
    
}

extension RKChannel: RKChannelInterface {
    
    fileprivate func getParticipant(userId: String) -> RKChannelParticipant? {
        
        guard let participant = participants.first(where: { $0.userId == userId }) else {
            return nil
        }
        
        return participant
        
    }
    
    public func addChannelMsg(listener: RKChannelMsgListener) {
        
        RKRTCManager.shared.addChannelMsg(listener: listener)
        
    }
    
    public func removeChannelMsg(listener: RKChannelMsgListener) {
        
        RKRTCManager.shared.removeChannelMsg(listener: listener)
        
    }
    
    public func addChannel(listener: RKChannelListener) {
        
        RKRTCManager.shared.addChannel(listener: listener)
    }
    
    public func removeChannel(listener: RKChannelListener) {
        
        RKRTCManager.shared.removeChannel(listener: listener)
        
    }
    
    public func addDevice(listener: RKDeviceListener) {
        
        RKRTCManager.shared.addDevice(listener: listener)
        
    }
    
    public func removeDevice(listener: RKDeviceListener) {
        
        RKRTCManager.shared.removeDevice(listener: listener)
        
    }
    
    public func addRemoteDevice(listener: RKRemoteDeviceListener) {
        
        RKRTCManager.shared.addRemoteDevice(listener: listener)
    }
    
    public func removeRemoteDevice(listener: RKRemoteDeviceListener) {
        
        RKRTCManager.shared.removeRemoteDevice(listener: listener)
        
    }
    
    public func addShare(listener: RKShareListener) {
        
        RKChannelManager.shared.addChannelShare(listener: listener)
        
    }
    
    public func removeShare(listener: RKShareListener) {
        
        RKChannelManager.shared.removeChannelShare(listener: listener)
        
    }
    
    public func join(param: RKChannelParam?)  {
        
        RKLog("加入会议:" + channelId)
        if let param = param {
            channelParam = param
        }
        
        channelParam.recordParam = recordParams
        
        RKRTCManager.shared.join(channelId: channelId, joinParam: channelParam)
    }
    
    public func leave() {
        
        RKRTCManager.shared.leave()
        
    }
    
    public func kickOutUser(userId: String) {
        
        RKRTCManager.shared.kickOutUser(userId: userId)
        
    }
    
    public func dispose() {
        
        RKRTCManager.shared.dispose()
        
        RKChannelManager.shared.channelList.removeAll(where: { $0.channelId == channelId })
        
    }
    
    public func enableUploadLocalAudioStream(enable: Bool) {
        
        if enable == true {
            RKLog("上传音频 打开")
        } else {
            RKLog("上传音频 关闭")
        }
        
        RKRTCManager.shared.enableUploadLocalAudioStream(enable: enable)
        
    }
    
    public func enableUploadLocalVideoStream(enable: Bool) {
        
        if enable == true {
            RKLog("上传视频 打开")
        } else {
            RKLog("上传视频 关闭")
        }
        
        RKRTCManager.shared.enableUploadLocalVideoStream(enable: enable)
        
    }
    
    public func enableAudioOutput(enable: Bool) {
        
        
        RKRTCManager.shared.enableAudioOutput(enable: enable)
        
    }
    
    public func getVideoSize(userId: String) -> RKVideoSize {
        
        guard let participant = getParticipant(userId: userId) else {
            return .SIZE_NONE
        }
        
        return participant.videoSize
    }
    
    public func isCreator(userId: String) -> Bool {
        
        guard let participant = getParticipant(userId: userId) else {
            return false
        }
        
        return participant.isCreator
        
    }
    
    public func getNetStatus(userId: String) -> RKNetStatus {
        
        guard let participant = getParticipant(userId: userId) else {
            return .NORMAL
        }
        
        return participant.netStatus
        
    }
    
    public func isAudioUpload(userId: String) -> Bool {
        
        guard let participant = getParticipant(userId: userId) else {
            return false
        }
        
        return participant.isAudioStart
        
    }
    
    public func isVideoUpload(userId: String) -> Bool {
        
        guard let participant = getParticipant(userId: userId) else {
            return false
        }
        
        return participant.isVideoStart
        
    }
    
    public func getVolumeStatus(userId: String) -> RKVolumeStatus {
        
        guard let participant = getParticipant(userId: userId) else {
            return .NONE
        }
        
        return participant.volumeStatus
        
    }
    
    public func getDisplayName(userId: String) -> String? {
        
        guard let participant = getParticipant(userId: userId) else {
            return nil
        }
        
        return participant.displayName
        
    }
    
    public func setCustom(property: String) {
        
        RKRTCManager.shared.setCustomProperty(property: property)
        
    }
    
    public func getCustomProperty() -> String? {
        
        return RKRTCManager.shared.getCustomProperty()
        
    }
    
    public func sendChannelMessage(msg: String) {
        
        RKMessageCenter.sendChannelMessage(msg)
        
    }
    
    public func getChannelId() -> String? {
        
        return channelId
        
    }
    
    public func getChannelState() -> RKChannelState {
        
        return RKRTCManager.shared.getChannelState()
        
    }
    
    public func getChannelPassword() -> String? {
        
        return RKRTCManager.shared.getChannelPassword()
        
    }
    
    public func isLocalAudioUpload() -> Bool {
        
        return RKRTCManager.shared.isLocalAudioOutput()
        
    }
    
    public func isLocalVideoUpload() -> Bool {
        
        return RKRTCManager.shared.isLocalVideoUpload()
        
    }
    
    public func isLocalAudioOutput() -> Bool {
        
        return RKRTCManager.shared.isLocalAudioOutput()
        
    }
    
    public func isScreenShare() -> Bool {
        
        return RKRTCManager.shared.isScreenShare()
        
    }
    
    public func getScreenShareUserId() -> String? {
        
        return RKRTCManager.shared.getScreenShareUserId()
        
    }
    
    public func switchStream(userId: String, isHighStram: Bool) {
        
        RKRTCManager.shared.switchStream(userId: userId, isHighStram: isHighStram)
    }
    
    public func muteAll() {
        
        let message = RKMessage(msgType: .KeepSilence, msgBody: "")
        guard let messageString = message.toJSONString() else {
            return
        }
        RKMessageCenter.sendChannelMessage(messageString)
    }
    
    public func setRecord(params: RKRemoteRecordParams) {
        
        self.recordParams = params
        
    }
    
    public func enableRecord(enable: Bool) {
        
        RKRTCManager.shared.enableRecord(enable: enable)
    }
    
    public func getRecordState() -> RKRecordState {
        
        return RKRTCManager.shared.getRecordState()
        
    }
    
    public func queryChannel(result: RKOperationListener) {
        
        RKRTCManager.shared.queryChannel(channelId: channelId, result: result)
        
    }
    
    public func getMaxResolution() -> RKResolution {
        
        return RKRTCManager.shared.getMaxResolution()
        
    }
    
    /// 开启摄像头
    public func startCamera() {
        
        RKRTCManager.shared.startCamera()
        
    }
    /// 关闭摄像头
    public func stopCamera() {
        
        RKRTCManager.shared.stopCamera()
        
    }
    /// 切换摄像头
    public func switchCamera() {
        
        RKRTCManager.shared.switchCamera()
        
    }
    
    /// 设置摄像头采集分辨率
    public func setCameraProperty(width: Int32, height: Int32, framerate: Int32) {
        
        RKRTCManager.shared.setCameraProperty(width: width, height: height, framerate: framerate)
        
    }
    
    public func startShareScreen() {
        
        if #available(iOS 11.0, *) {
            RKShareScreenManager.shared.startShareScreen(channelId: channelId)
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    public func stopShareScreen() {
        
        if #available(iOS 11.0, *) {
            RKShareScreenManager.shared.stopShareScreen(channelId: channelId)
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    public func startShareDoodle() {
        
        RKShareDoodleManager.shared.startShareDoodle(channelId: channelId)
        
    }
    
    public func stopShareDoodle() {
        
        RKShareDoodleManager.shared.stopShareDoodle(channelId: channelId)
        
    }
    
    public func startShareImageDoodle(imageUrl: String) {
        
        RKShareDoodleManager.shared.startShareDoodle(channelId: channelId, doodleImageUrl: imageUrl)
        
    }
    
    public func stopShareImageDoodle() {
        
        RKShareDoodleManager.shared.stopShareDoodle(channelId: channelId)
        
    }
    
    public func inviteShareSlam(userId: String) {
        
        RKShareSlamManager.shared.inviteShareSlam(channelId: channelId, userId: userId)
        
    }
    
    public func stopInviteShareSlam() {
        
        RKShareSlamManager.shared.stopInviteShareSlam(channelId: channelId)
        
    }
    
}
