//
//  RKChannelInterface.swift
//  RKCooperationCore
//
//  Created by Rokid on 2021/12/17.
//

import Foundation

@objc public protocol RKChannelInterface: NSObjectProtocol {
    
    /// 添加频道内消息监听
    /// - Parameter listener @RKChannelMsgListener
    @objc func addChannelMsg(listener: RKChannelMsgListener)
    
    /// 移除频道内监听
    /// - Parameter listener @RKChannelMsgListener
    @objc func removeChannelMsg(listener: RKChannelMsgListener)
    
    /// 添加监听
    /// - Parameter listener @RKChannelListener
    @objc func addChannel(listener: RKChannelListener)
    
    /// 移除监听
    /// - Parameter listener @RKChannelListener
    @objc func removeChannel(listener: RKChannelListener)
    
    /// 添加本地设备监听
    /// - Parameter listener @RKDeviceListener
    @objc func addDevice(listener: RKDeviceListener)
    
    /// 移除本地设备监听
    /// - Parameter listener @RKDeviceListener
    @objc func removeDevice(listener: RKDeviceListener)
    
    /// 添加远端设备监听
    /// - Parameter listener @RKDeviceListener
    @objc func addRemoteDevice(listener: RKRemoteDeviceListener)
    
    /// 移除远端设备监听
    /// - Parameter listener @RKRemoteDeviceListener
    @objc func removeRemoteDevice(listener: RKRemoteDeviceListener)
    
    /// 添加分享功能监听
    /// - Parameter listener @RKShareListener
    @objc func addShare(listener: RKShareListener)
    
    /// 移除分享功能监听
    /// - Parameter listener @RKShareListener
    @objc func removeShare(listener: RKShareListener)
    
    /// 加入频道
    @objc func join(param: RKChannelParam?)
    
    /// 离开频道
    @objc func leave()
    
    /// 将指定用户踢出频道
    /// - Parameter userId 踢出用户的userId
    @objc func kickOutUser(userId: String)
    
    /// 关闭频道，其他端将自动退出频道，调用后将在[RKChannelListener.onChannelStopResult]收到关闭结果
    /// 调用端将收到onChannelStopResult回调，其他端将受到[RKChannelListener.onChannelStopResult]，
    /// 并且reason值为[RKErrorCode.CHANNEL_OVER]
    @objc func dispose()
    
    /// 是否开启上传音频流
    /// - Parameter enable true: 开启，false: 关闭
    @objc func enableUploadLocalAudioStream(enable: Bool)
    
    /// 是否开启上传视频流
    /// - Parameter enable true: 开启，false: 关闭
    @objc func enableUploadLocalVideoStream(enable: Bool)
    
    /// 是否开启本地音频输出
    /// - Parameter enable true: 开启，false: 关闭
    @objc func enableAudioOutput(enable: Bool)
    
    /// 获取用户上传的视频流大小
    /// - Parameter userId 用户ID
    /// - Return @RKVideoSize
    @objc func getVideoSize(userId: String) -> RKVideoSize
    
    /// 是否频道创建者
    /// - Parameter userId 用户ID
    @objc func isCreator(userId: String) -> Bool
    
    /// 获取频道内用户的网络状态
    /// - Parameter userId 用户ID
    /// - Return 见[NetStatus]
    @objc func getNetStatus(userId: String) -> RKNetStatus
    
    /// 获取用户音频是否上传
    /// - Parameter userId 用户ID
    /// - Return true: 开启，false: 未开启
    @objc func isAudioUpload(userId: String) -> Bool
    
    /// 获取用户视频是否上传
    /// - Parameter userId 用户ID
    /// - Return true: 开启，false: 未开启
    @objc func isVideoUpload(userId: String) -> Bool
    
    /// 获取用户mic输入音量状态
    /// - Parameter userId 用户ID
    /// - Return @RKVolumeStatus
    @objc func getVolumeStatus(userId: String) -> RKVolumeStatus
    
    /// 获取用户设置的显示昵称
    /// - Parameter userId 用户ID
    /// - Return 用户设置的显示昵称
    @objc func getDisplayName(userId: String) -> String?
    
    /// 获取屏幕共享流
    /// - Parameters:
    ///  - userId: 获取视频流所属用户id
    ///  - videoSize: 共享流的视频尺寸， @RKVideoSize
    @objc func requestScreenVideo(userId: String, videoSize: RKVideoSize)
    
    /// 设置频道自定义属性，设置后所有成员将通过 [RKChannelListener.onCustomPropertyChanged]
    /// 收到最新的属性值
    /// - Parameter property 要设置的频道自定义属性
    @objc func setCustom(property: String)
    
    /// 查询频道自定义属性
    /// - Return 返回频道的自定义属性
    @objc func getCustomProperty() -> String?
    
    /// 发送频道内消息，toUserId不为空时将发送给指定用户，否则发给频道内所有用户
    /// - Parameters:
    ///  - msg: 要发送的频道消息主体
    ///  - toUserIds: 要发送的频道用户Id list，如果传nil则发送给频道内所有成员
    ///  - operationListener: 发送频道消息的结果，@RKOperationListener
    @objc func sendChannelMessage(msg: String, to userIds: [String]?)
    
    /// 获取频道id
    /// - Return 当前频道ID，如果未加入频道则返回null
    @objc func getChannelId() -> String?
    
    /// 获取频道当前状态
    /// - Return @RKChannelState
    @objc func getChannelState() ->RKChannelState
    
    /// 获取频道密码，未设置默认123456
    /// - Return 当前频道的密码，密码由创建房间的人设置，见[ChannelParam.password]
    @objc func getChannelPassword() -> String?
    
    /// 本地音频是否上传
    /// - Return true: 本地音频正在上传，false: 本地音频未在上传
    @objc func isLocalAudioUpload() -> Bool
    
    /// 本地视频是否上传
    /// - Return true: 本地视频正在上传，false: 本地视频未在上传
    @objc func isLocalVideoUpload() -> Bool
    
    /// 本地音频输出与否
    /// - Return true: 当前已开启音频输出，false: 当前未开启音频输出
    @objc func isLocalAudioOutput() -> Bool
    
    /// 频道是否在共享屏幕
    /// - true: 有人在共享屏幕，false: 没有人在共享屏幕
    @objc func isScreenShare() -> Bool
    
    /// 获取频道内正在共享的用户userId
    /// - Return 返回当前正在屏幕共享的用户id，如果当前没有用户在共享屏幕则返回null
    @objc func getScreenShareUserId() -> String?
    
    /// 查询频道信息
    /// - Parameter result 查询频道信息结果，@RKOperationListener
    @objc func queryChannel(result: RKOperationListener)
    
    /// 获取频道的最大分辨率
    /// 频道中的最大分辩由第一个加入频道的用户决定， JoinParam 参数中设置的分辩率并一定是频道的最大分辨率，
    /// 只有加入成功后才能准确知道
    /// - Return @RKResolution
    @objc func getMaxResolution() -> RKResolution
    
    // MARK: - 云端录制
    
    @objc func setRecord(params: RKRemoteRecordParams)
    
    /// 开启云端视频录制，需要在录制状态[RecordState.STATE_READY]的时候调用，同时如果需要开启云端录制，需要在
    /// 创建频道的时候在[IChannel.join]函数的[ChannelParam.recordParam]传入录制参数
    /// @param enable true: 开启，false: 关闭
    @objc func enableRecord(enable: Bool)
    
    /// 查询视频录制状态
    /// - Return @RKRecordState
    @objc func getRecordState() -> RKRecordState
    
    // MARK: - 分享功能
    
    /// 开启屏幕共享
    @objc func startShareScreen()
    
    /// 结束屏幕共享
    @objc func stopShareScreen()
    
    /// 发起白板标注
    @objc func startShareDoodle()
    
    /// 结束白板共享
    @objc func stopShareDoodle()
    
    /// 发起截图标注
    /// - Parameter imageUrl 图片地址
    @objc func startShareImageDoodle(imageUrl: String)
    
    /// 结束截图标注
    @objc func stopShareImageDoodle()
    
    /// 邀请频道内其他人发起AR标注
    /// - Parameter userId 对方userId
    @objc func inviteShareSlam(userId: String)
    
    /// 结束自己邀请发起的AR标注
    @objc func stopInviteShareSlam()
    
}

