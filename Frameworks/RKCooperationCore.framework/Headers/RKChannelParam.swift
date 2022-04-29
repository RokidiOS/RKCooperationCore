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
    
    /// 最多允许多少人加入当前频道 ,目前最多只支持16个人同时进行音视频聊天
    public var maxMembers: Int = 16
    
    /// 频道最大支持分辨率 默认为720p
    public var maxResolution: RKResolution = .RESOLUTION_720
    
    /// 频道密码，默认无密码
    public var password: String?
        
    /// 频道视频帧率，默认24帧
    public var frameRate: Int32 = 24
    
    /// 频道自定义属性
    public var extraParam: String?
        
    /// 音频开关
    public var isVideo: Bool = true
    
    /// 视频开关
    public var isAudio: Bool = true
    
    /// 码率大小 kbps
    public var bitrate: Int32 = 2000
    
    /// 最大延迟 ms
    public var maxDelay: Int32 = 500
    
    required public override init() {}
    
}
