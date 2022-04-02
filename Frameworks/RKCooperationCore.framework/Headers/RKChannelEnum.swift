//
//  RKChannelEnum.swift
//  Pods
//
//  Created by Rokid on 2021/12/2.
//

import Foundation
import RKIHandyJSON

// MARK: - 频道状态
@objc public enum RKChannelState: Int32, HandyJSONEnum {
    /// 空闲
    case STATE_IDLE = 0
    /// 加入中
    case STATE_JOINING = 1
    /// 已加入
    case STATE_JOINED = 2
    /// 离开中
    case STATE_LEAVING = 3
}

// MARK: - 录制状态
@objc public enum RKRecordState: Int32, HandyJSONEnum {
    /// 未开始录制
    case STATE_NONE = 0
    /// 准备开始录制，可以调用[IChannel.enabeRecord]开始录制
    case STATE_READY = 1
    /// 录制中
    case STATE_RUNNING = 2
}

// MARK: - 视频清晰度
@objc public enum RKResolution: Int32, HandyJSONEnum {
    /// 360P
    case RESOLUTION_360 = 0
    /// 720P
    case RESOLUTION_720 = 1
    /// 1080P
    case RESOLUTION_1080 = 2
}

// MARK: - 渲染参数
@objc public enum RKRenderType: Int32, HandyJSONEnum {
    /// 自适应
    case RENDER_FULL_AUTO = 0
    /// 全屏渲染
    case RENDER_FULL_SCREEN = 1
    /// 平铺整个窗口
    case RENDER_FULL_CONTENT = 2
}

// MARK: - 视频尺寸
@objc public enum RKVideoSize: Int32, HandyJSONEnum {
    /// 不渲染
    case SIZE_NONE = 0
    /// 最小尺寸
    case SIZE_MIN = 1
    /// 小尺寸
    case SIZE_SMALL = 2
    /// 大尺寸
    case SIZE_LARGE = 3
    /// 最大尺寸
    case SIZE_MAX = 4
}

// MARK: - 声音状态
@objc public enum RKVolumeStatus: Int32, HandyJSONEnum {
    /// 未上传音频
    case NONE = 0
    /// 音量0
    case ZERO = 1
    /// 音量低
    case LOW = 2
    /// 音量中
    case MID = 3
    /// 音量高
    case HIGH = 4
}

// MARK: - 网络状态
@objc public enum RKNetStatus: Int32, HandyJSONEnum {
    /// 无网络
    case DISCONNECT = 0
    /// 网络非常差
    case VERY_BAD = 1
    /// 网络差
    case BAD = 2
    /// 网络一般
    case NORMAL = 3
    /// 网络好
    case GOOD = 4
    /// 网络非常好
    case VERY_GOOD = 5
}

// MARK: - 摄像头类型
@objc public enum RKCameraType: Int32, HandyJSONEnum {
    /// 未找到摄像头
    case NONE = 0
    /// 前置摄像头
    case FRONT = 1
    /// 后置摄像头
    case BACK = 2
    /// 其他摄像头
    case OTHER = 3
}

@objc public enum RKAudioOutputType: Int32, HandyJSONEnum {
    case NONE = 0
}

// MARK: - 云存储类型
@objc public enum RKRecordProtocol: Int32, HandyJSONEnum {
    /// AWS协议存储服务器
    case AWS = 1
    /// 七牛云存储服务器
    case QI_NIU = 2
    /// 阿里云存储服务器
    case A_LI_YUN = 3
}

// MARK: - 旋转角度
@objc public enum RKRotation: NSInteger, HandyJSONEnum {
    case VideoRotation_0 = 0
    case VideoRotation_90 = 90
    case VideoRotation_180 = 180
    case VideoRotation_270 = 270
}
