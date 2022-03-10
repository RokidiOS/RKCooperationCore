//
//  RKPoint.swift
//  Pods
//
//  Created by Rokid on 2021/11/17.
//

import Foundation
import RKIHandyJSON

// 点位
@objcMembers
public class RKPoint: NSObject, HandyJSON {
    
    public var x: Float = 0.5
    
    public var y: Float = 0.5
    
    required public override init() {}
    
}
