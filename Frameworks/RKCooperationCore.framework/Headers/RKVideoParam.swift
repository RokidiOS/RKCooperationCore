//
//  RKVideoParam.swift
//  Pods
//
//  Created by Rokid on 2021/11/17.
//

import Foundation

@objcMembers
public class RKVideoParam: NSObject {
    
    /// 采集宽度，默认640
    public var width: Int = 640
    /// 采集高度，默认360
    public var height: Int = 360
    /// 采集帧率，默认24
    public var framerate: Int = 24
    
}
