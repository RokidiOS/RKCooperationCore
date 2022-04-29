//
//  RKChannelManagerInterface.swift
//  RKCooperationCore
//
//  Created by Rokid on 2021/12/14.
//

import Foundation
import RKRTC

@objc public protocol RKChannelManagerInterface: NSObjectProtocol {
    
    static var shared: RKChannelManager! { get }
    
    /// 新建频道
    /// - Parameter channelId 频道ID，不传由内部创建，外部传入需要调用SDK接口生成， 长度限制50个字符
    /// - Parameter channelTitle 频道标题
    /// - Parameter channelParam 频道属性，不传由内部生成默认频道配置
    /// - Parameter userIdList 创建成功 将会自动给userIdList中的用户发送邀请
    /// - Returns: @RKChannel
    @objc func create(channelId: String?,
                      channelTitle: String?,
                      channelParam: RKChannelParam?,
                      userIdList: [String]?,
                      onSuccess: RKOnSuccess?,
                      onfailed: RKOnFailed?)
    
    /// 获取频道
    /// - Parameter channelId 频道ID
    /// - Returns: @RKChannel
    @objc func getChannel(channelId: String) -> RKChannel?
    
    ///  加入频道
    /// - Parameter channelId 频道ID，不传由内部创建，外部传入需要调用SDK接口生成
    /// - Parameter channelPassword 频道密码  默认 无密码
    @objc func join(channelId: String,
                    channelPassword: String?, onSuccess: RKOnSuccess?, onFailed: RKOnFailed?)
    
    ///  离开频道， 用于离开登录返回的已经在的频道
    /// - Parameter channelId 频道ID
    @objc func leave(channelId: String)
    
    /// 添加频道监听
    @objc func addChannel(listener: RKChannelListener)
    
    /// 移除频道监听
    @objc func removeChannel(listener: RKChannelListener)
    
    /// 添加频道内分享功能监听
    @objc func addChannelShare(listener: RKShareListener)
    
    /// 移除频道内分享功能监听
    @objc func removeChannelShare(listener: RKShareListener)
    
    /// 开启频道录制
    /// - Parameters:
    ///  - channelId: 频道ID
    ///  - channelId: 录制保存文件夹
    ///  - channelId: 录制文件名
    ///  - resolution: 录制分辨率，@RKResolution
    ///  - subStream: 录制流，@RKStreamType
    @objc func startServerRecording(channelId: String, bucket: String, fileName: String, resolution: RKResolution, subStream: RKIStreamType, onSuccess: RKOnSuccess?, onFailed: RKOnFailed?)
    
    /// 结束频道录制
    /// - Parameters:
    ///  - channelId: 频道ID
    ///  - save: 是否保存文件，true：保存，false：不保存
    @objc func stopServerRecording(channelId: String, save: Bool)
    
}

@objcMembers
public class RKChannelManager: NSObject {}
