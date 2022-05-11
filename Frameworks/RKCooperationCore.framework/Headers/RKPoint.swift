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
        
//    public func mapping(mapper: HelpingMapper) {
//        mapper <<<
//        [
//            x <-- TransformOf<Float, Any>(fromJSON: { value in
//                if let value = value as? Float {
//                    return value
//                }
//                if let value = value as? Double {
//                    return Float(value)
//                }
//                return value as? Float
//            }, toJSON: { x in
//                if let x = x?.format(f: "0.3") {
//                    return x
//                }
//                return x
//            }),
//
//            y <-- TransformOf<Float, Any>(fromJSON: { value in
//                if let value = value as? Float {
//                    return value
//                }
//                if let value = value as? Double {
//                    return Float(value)
//                }
//                return value as? Float
//            }, toJSON: { y in
//                if let y = y?.format(f: "0.3") {
//                    return y
//                }
//                return y
//            })
//        ]
//    }
}

fileprivate extension Float {

    func format(f:String) ->String {
        return NSString(format:"%\(f)f" as NSString, self) as String
    }
    
}
