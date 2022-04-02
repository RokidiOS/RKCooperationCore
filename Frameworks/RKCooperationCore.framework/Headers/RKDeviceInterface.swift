//
//  RKDeviceInterface.swift
//  RKCooperationCore
//
//  Created by Rokid on 2021/12/23.
//

import UIKit

@objc public protocol RKDeviceInterface: NSObjectProtocol {
    
    /// 开启摄像头
    @objc static func openCamera()

    /// 关闭摄像头
    @objc static func closeCamera()

    /// 切换摄像头
    @objc static func switchCamera()
    
    /// 设置摄像头采集属性
    ///  startVideo:pictureSize: startVideo 方法开启自身视频渲染前设置即可生效
    /// - Parameters:
    /// - width     采集宽度，默认640
    /// - height    采集高度，默认360
    /// - frameRate 采集帧速率，默认15
    @objc static func setCameraProperty(width: Int32, height: Int32, framerate: Int32)
        
    /// 开始自身视频渲染
    /// - Parameters:
    ///  - type @RKRenderType
    ///  - view 需要渲染视频到的视图
    @objc static func startCameraVideo(type: RKRenderType, view: UIView)
    
    /// 开关扬声器
    @objc static func enableSpeaker(_ enable: Bool)
    
    /// 开启自定义视频流传输
    @objc static func startVideoFile()

    /// 逐帧传递自定义视频流
    @objc static func setVideoFileFrame(_ bufferRef: CVPixelBuffer, rotation: RKRotation)
    
    /// 结束自定义视频流传输，如果之前开启了相机视频流，默认恢复相机视频流
    @objc static func stopVideoFile()

}

@objcMembers
public class RKDevice: NSObject {}

