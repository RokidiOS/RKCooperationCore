//
//  RKDoodle.swift
//  Pods
//
//  Created by Rokid on 2021/11/17.
//

import Foundation
import RKIHandyJSON
import RKIUtils

// Doodle标注类型
@objc public enum RKDoodleAction: Int, HandyJSONEnum {
    case unknown      = -1 // 未知状态
    case add          = 0  // doodle新增
    case revoke       = 1  // doodle撤销
    case clear        = 2  // doodle清除
}

@objcMembers
public class RKDoodle: NSObject, HandyJSON {
    public var doodleId: String           = ""   // | doodle唯一标识 uuid
    public var doodleNo: Int              = 0    // | doodle序号 维护自己标记的先后顺序
    public var userId: String             = ""   // | doodle发起者id
    public var actionType: RKDoodleAction = .add // | doodle类型 0 新增 1 撤销 2 清除
    public var brushColor: String         = ""   // | doodle颜色 #ffffff
    public var brushWidth: Float          = 1.0  // | doodle线宽 1.0 px
    public var points: [RKPoint]          = []   // | doodle点位集（基于视图的x,y比例）
    
    public func add(point: RKPoint) {
        points.append(point)
    }
    
    required public override init() {}
    
    @objc public init(action: RKDoodleAction, brushColor: UIColor?, brushWidth: Float = 1.0) {
        doodleId = String.uuid().replacingOccurrences(of: "-", with: "")
        self.actionType = action
        if let brushColor = brushColor {
            self.brushColor = brushColor.hexString
        }
        self.brushWidth = brushWidth
        
        super.init()
    }
    
}
