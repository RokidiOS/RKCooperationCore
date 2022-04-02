//
//  RKVideoCanvas.swift
//  Pods
//
//  Created by Rokid on 2021/12/2.
//

import Foundation
import UIKit

@objcMembers
public class RKVideoCanvas: NSObject {
    
    /// 用户Id
    var userId: String = ""
    
    /// 视频视图
    public var videoView: UIView?
    
    /// 暂停视频渲染
    public func pause() {
        
        RKRTCManager.shared.pause(userId: userId)
    }
    
    /// 恢复视频渲染
    public func resume() {
        
        RKRTCManager.shared.resume(userId: userId)
    }
    
    /// 旋转视频角度，TIPS：必须是90°的倍数，该角度表示与屏幕正方向旋转后的夹角
    //// @param angle 要旋转的角度
    public func rotate(angle: Int) {
        
        RKRTCManager.shared.rotate(userId: userId, angle: angle)
    }
    
    /// 视频通话截图
    /// @param width 要保存的图片宽
    /// @param height 要保存的图片高
    /// @param filePath 要保存的图片路径
    /// @param result 视频通话截图结果回调，见[RKOperationListener]
    public func snapshot(width: Int32, height: Int32, filePath: String) -> UIImage? {
        
        return RKRTCManager.shared.snapshot(userId: userId,
                                            width: width,
                                            height: height,
                                            filePath: filePath)
    }
    
    /// 对焦
    /// @param xPercent 焦点所在渲染视图 x 轴的比例,取值需要归一化 0-1
    /// @param yPercent 焦点所在渲染视图 y 轴的比例,取值需要归一化 0-1
    public func focus(xPercent: Float, yPercent: Float) {
        
        RKRTCManager.shared.focus(userId: userId, xPercent: xPercent, yPercent: yPercent)
    }
    
}
