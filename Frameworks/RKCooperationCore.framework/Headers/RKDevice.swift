//
//  RKDevice.swift
//  RKCooperationCore
//
//  Created by Rokid on 2021/12/23.
//

import UIKit
import RKRTC

extension RKDevice: RKDeviceInterface {
    
    /// 开启摄像头
    public static func openCamera() {
        
        RKRTCManager.shared.startCamera()
        
    }
    
    /// 关闭摄像头
    public static func closeCamera() {
        
        RKRTCManager.shared.stopCamera()
        
    }
    
    /// 切换摄像头
    public static func switchCamera() {
        
        RKRTCManager.shared.switchCamera()
        
    }
    
    /// 设置摄像头采集分辨率
    public static func setCameraProperty(width: Int32, height: Int32, framerate: Int32) {
        RKRTCManager.shared.setCameraProperty(width: width, height: height, framerate: framerate)
    }
    
    public static func startCameraVideo(type: RKRenderType, view: UIView) {
        
        RKRTCManager.shared.startCameraVideo(renderType: type, in: view)
        
    }
    
    public static func enableSpeaker(_ enable: Bool) {
        
        RKRTCManager.shared.enableSpeaker(enable)
        
    }
    
    public static func startVideoFile() {
        return RKRTCManager.shared.startVideoFile()
        
    }
    
    public static func stopVideoFile() {
        
        return RKRTCManager.shared.stopVideoFile()
    }
    
    public static func setVideoFileFrame(_ bufferRef: CVPixelBuffer, rotation: RKRotation) {
        
        let size = CVImageBufferGetEncodedSize(bufferRef)
        let width = Int32(size.width)
        let height = Int32(size.height)
        guard let rotation = RKVideoRotation(rawValue: rotation.rawValue) else { return }
        RKRTCManager.shared.setVideoFileFrame(bufferRef,
                                              width: width,
                                              height: height,
                                              rotation: rotation)
    }
    
}


