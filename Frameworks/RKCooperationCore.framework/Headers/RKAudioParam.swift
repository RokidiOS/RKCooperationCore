//
//  RKAudioParam.swift
//  Pods
//
//  Created by Rokid on 2021/11/17.
//

import Foundation

@objcMembers
public class RKAudioParam: NSObject {
    
    /// 音频输入采样率 0 表示自动选择，手表等设备可以设置为 8000，默认值为 0
    public var audioInputSamplingRate: Int = 0
    /// 音频输出采样率 0 表示自动选择，手表等设备可以设置为 8000，默认值为 0
    public var audioOutputSamplingRate: Int = 0
    /// 音频输入通道数量 0 表示自动选择，0 和 1 表示单通道，>= 2 表示双通道，默认值为0
    public var audioInputChannelNumber: Int = 0
    /// 音频输出通道数量 0 表示自动选择，0 和 1 表示单通道，>= 2 表示双通道，默认值为0
    public var audioOutputChannelNumber: Int = 0
    /// 是否自动打开音频输出设备
    public var autoStartAudioOutputDevice: Bool = false
    /// 是否自动打开音频输入设备
    public var autoStartAudioInputDevice: Bool = false

}
