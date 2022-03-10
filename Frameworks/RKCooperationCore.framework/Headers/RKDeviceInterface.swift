//
//  RKDeviceInterface.swift
//  RKCooperationCore
//
//  Created by Rokid on 2021/12/23.
//

import UIKit

@objc public protocol RKDeviceInterface: NSObjectProtocol {
    
    /// 开启摄像头
    @objc static func startCamera()

    /// 关闭摄像头
    @objc static func stopCamera()

    /// 切换摄像头
    @objc static func switchCamera()
    
    /// 设置摄像头采集属性
    ///  startVideo:pictureSize: startVideo 方法开启自身视频渲染前设置即可生效
    /// - Parameters:
    /// - width     采集宽度，默认640
    /// - height    采集高度，默认360
    /// - frameRate 采集帧速率，默认24
    @objc static func setCameraProperty(width: Int32, height: Int32, framerate: Int32)
        
    /// 开始自身视频渲染
    /// - Parameters:
    ///  - type @RKRenderType
    ///  - view 需要渲染视频到的视图
    @objc static func startCameraVideo(type: RKRenderType, view: UIView)
    
}

@objcMembers
public class RKDevice: NSObject {}

