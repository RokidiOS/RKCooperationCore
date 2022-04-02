//
//  RKShareDoodleInterface.swift
//  RKCooperationCore
//
//  Created by Rokid on 2022/1/14.
//

import Foundation

@objc public protocol RKShareDoodleInterface: NSObjectProtocol {
    
    static var shared: RKShareDoodleManager! { get }
    
    /// 清空
    @objc func clear()
    
    /// 开启白板标注
    /// - Parameter channelId: 频道ID
    @objc func startShareDoodle(channelId: String)
    
    /// 开启截图标注
    /// - Parameters:
    ///   - channelId: 频道ID
    ///   - doodleImageUrl: 标注图片地址
    @objc func startShareDoodle(channelId: String,
                                doodleImageUrl: String)
    
    /// 加入Doodle标注
    /// - Parameters:
    ///   - channelId: 频道ID
    ///   - doodleImageUrl: 标注图片地址
    @objc func joinShareDoodle(channelId: String)
    
    /// 加入截图标注
    /// - Parameters:
    ///   - channelId: 频道ID
    ///   - doodleImageUrl: 标注图片地址
    @objc func joinShareDoodle(channelId: String,
                               doodleImageUrl: String)
    
    /// 结束标注
    /// - Parameter channelId: 频道ID
    @objc func stopShareDoodle(channelId: String)
    
    /// 新增一笔
    /// - Parameters:
    ///   - channelId: 频道ID
    ///   - doodle: doodle
    @objc func add(channelId: String, doodle: RKDoodle)
    
    /// 撤销一笔
    /// - Parameters:
    ///   - channelId: 频道ID
    ///   - doodle: doodle
    @objc func revoke(channelId: String, doodle: RKDoodle?)
    
    /// 清除标注
    /// - Parameter channelId: 频道ID
    @objc func clear(channelId: String)
    
}

@objcMembers
public class RKShareDoodleManager: NSObject {
    
    public lazy var drawView = RKDrawView()
    
    public lazy var doodles: [RKDoodle] = []
    
    var channelId: String?
    
}
