//
//  RKIRecordingStateModel.swift
//  RKCooperationCore
//
//  Created by Amos on 2022/4/14.
//

import Foundation
import RKIHandyJSON

@objcMembers
public class RKIRecordingStateModel: NSObject, HandyJSON {
    // 录制状态
    public var recordingState: RKRecordState?
    // 文件链接
    public var url: String?
    // 开始时间
    public var startTime: String?
    // 结束时间
    public var endTime: String?
    // error时会有错误信息
    public var message: String?

    required public override init() {}
    
}
