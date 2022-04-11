//
//  RKChannelManagerInterface.swift
//  RKCooperationCore
//
//  Created by Rokid on 2021/12/14.
//

import Foundation

@objc public protocol RKChannelManagerInterface: NSObjectProtocol {
    
    static var shared: RKChannelManager! { get }
    
    /// 新建频道
    /// - Parameter channelId 频道ID，不传由内部创建，外部传入需要调用SDK接口生成
    /// - Parameter channelTitle 频道标题
    /// - Parameter channelParam 频道属性，不传由内部生成默认频道配置
    /// - Returns: @RKChannel
    @objc func create(channelId: String?,
                      channelTitle: String?,
                      channelParam: RKChannelParam?) -> RKChannel?
    
    /// 获取频道
    /// - Parameter channelId 频道ID
    /// - Returns: @RKChannel
    @objc func getChannel(channelId: String) -> RKChannel?
    
    ///  加入频道
    /// - Parameter channelId 频道ID，不传由内部创建，外部传入需要调用SDK接口生成
    /// - Parameter channelPassword 频道密码  默认 123456
    @objc func join(channelId: String,
                    channelPassword: String?)
    
    /// 添加频道监听
    @objc func addChannel(listener: RKChannelListener)
    
    /// 移除频道监听
    @objc func removeChannel(listener: RKChannelListener)
    
    /// 添加频道内分享功能监听
    @objc func addChannelShare(listener: RKShareListener)
    
    /// 移除频道内分享功能监听
    @objc func removeChannelShare(listener: RKShareListener)

}

@objcMembers
public class RKChannelManager: NSObject {}
