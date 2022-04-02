//
//  RKChannelParam.swift
//  Pods
//
//  Created by Rokid on 2021/12/2.
//

import Foundation
import RKIHandyJSON

@objcMembers
public class RKChannelParam: NSObject, HandyJSON {
    
    /**
     * 最多允许多少人加入当前频道
     * 目前最多只支持16个人同时进行音视频聊天
     */
    public var maxMembers: Int32 = 16
    
    /**
     * 频道最大支持分辨率 默认为720p
     */
    public var maxResolution: RKResolution = .RESOLUTION_720
    
    /**
     * 频道密码，默认无密码
     */
    public var password: String?
    
    /**
     * 频道心跳间隔,默认20s
     */
    public var heartbeatTime: Int32 = 20
    
    /**
     * 频道心跳超时时间，默认60s
     */
    public var heartbeatTimeout: Int32 = 60
    
    /**
     * 频道视频帧率，默认24帧
     */
    public var frameRate: Int32 = 24
    
    /**
     * 频道自定义属性
     */
    public var extraParam: String?
    
    /**
     * 频道视频画面比例，传入值为宽高比浮点数，默认为 16:9
     */
    public var videoRatio: Float = 16 / 9
    
    /**
     * 频道录制参数
     */
    public var recordParam: RKRemoteRecordParams?
    
    /**
     * 音频开关
     */
    public var isVideo: Bool = true
    
    /**
     * 视频开关
     */
    public var isAudio: Bool = true
    
    required public override init() {}
    
}
