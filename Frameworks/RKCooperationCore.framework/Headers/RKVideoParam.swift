//
//  RKVideoParam.swift
//  Pods
//
//  Created by Rokid on 2021/11/17.
//

import Foundation

@objcMembers
public class RKVideoParam: NSObject {
    
    /// 采集宽度，默认1280
    public var width: Int = 1280
    /// 采集高度，默认720
    public var height: Int = 720
    /// 采集帧率，默认24
    public var framerate: Int = 24
    
}
