//
//  RKCooperationAPIProtocol.swift
//  RKCooperationCore
//
//  Created by Rokid on 2021/12/7.
//

import UIKit

@objc public protocol RKCooperationAPIInterface: NSObjectProtocol {
    
    static var shared: RKAPIManager! { get }
    
    /// 登录
    /// - Parameters:
    ///   - companyId: 公司
    ///   - userName: 用户名
    ///   - password: 密码
    ///   - onSuccess: 成功回调
    ///   - onFailed: 失败回调
    @objc func login(companyId: String,
                     userName: String,
                     password: String,
                     onSuccess: RKOnSuccess?,
                     onFailed: RKOnFailed?)
    
    /// 刷新token
    /// - Parameters:
    ///   - onSuccess: 成功回调
    ///   - onFailed: 失败回调
    @objc func refreshToken(params: [String: String],
                            onSuccess: RKOnSuccess?,
                            onFailed: RKOnFailed?)
    
    /// 联系人分组列表
    /// - Parameters:
    ///   - keyword: 查询关键字
    ///   - onSuccess: 成功回调
    ///   - onFailed: 失败回调
    @objc func groupList(keyword: String?,
                         onSuccess: RKOnSuccess?,
                         onFailed: RKOnFailed?)
    
    /// 联系人列表
    /// - Parameters:
    ///   - keyword: 查询关键字
    ///   - onSuccess: 成功回调
    ///   - onFailed: 失败回调
    @objc func contactsList(keyword: String?,
                            onSuccess: RKOnSuccess?,
                            onFailed: RKOnFailed?)
    
    // 通过license批量查询联系人信息
    @objc func queryCompanyUserList(by licenseCodeList: [String],
                                    onSuccess: RKOnSuccess?,
                                    onFailed: RKOnFailed?)
    
    /// 创建会议
    /// - Parameters:
    ///   - resolutionRatio: 分辨率
    ///   - meetingName: 会议名称
    ///   - onSuccess: 成功回调
    ///   - onFailed: 失败回调
    @objc func createChannel(resolutionRatio: String?,
                             meetingName: String?,
                             onSuccess: RKOnSuccess?,
                             onFailed: RKOnFailed?)
    
    /// 获取用户信息
    /// - Parameters:
    ///   - onSuccess: 成功回调
    ///   - onFailed: 失败回调
    @objc func getUserInfo(onSuccess: RKOnSuccess?,
                           onFailed: RKOnFailed?)
    
    /// 上报心跳
    /// - Parameters:
    ///   - onSuccess: 成功回调
    ///   - onFailed: 失败回调
    @objc func heartBeat(onSuccess: RKOnSuccess?,
                         onFailed: RKOnFailed?)
    
    /// 通过会议ID查询会议
    /// - Parameters:
    ///   - meetingId: 会议ID
    ///   - onSuccess: 成功回调
    ///   - onFailed: 失败回调
    @objc func getMeeting(meetingId: String!,
                          onSuccess: RKOnSuccess?,
                          onFailed: RKOnFailed?)
    
    /// 修改密码
    /// - Parameters:
    ///   - old: 旧密码
    ///   - new: 新密码
    ///   - onSuccess: 成功回调
    ///   - onFailed: 失败回调
    @objc func changePwd(old: String!,
                         new: String!,
                         onSuccess: RKOnSuccess?,
                         onFailed: RKOnFailed?)
    
    /// 获取二维码token
    /// - Parameters:
    ///   - onSuccess: 成功回调
    ///   - onFailed: 失败回调
    @objc func getGlassBindToken(onSuccess: RKOnSuccess?,
                                 onFailed: RKOnFailed?)
    
    /// 获取录制视频的URL
    /// - Parameters:
    ///   - bucketName: 文件夹名字
    ///   - expireTime: 过期时间
    ///   - fileName: 文件名
    ///   - onSuccess: 成功回调
    ///   - onFailed: 失败回调
    @objc func getRecordVideoFileUrl(bucketName: String!,
                                     expireTime: NSInteger,
                                     fileName: [String]!,
                                     onSuccess: RKOnSuccess?,
                                     onFailed: RKOnFailed?)
    
    /// 查询会议记录分页列表
    /// - Parameters:
    ///   - pageNum: 页码 默认1
    ///   - pageSize: 分页数量 默认10
    ///   - onSuccess: 成功回调
    ///   - onFailed: 失败回调
    @objc func queryUserMeetingRecordPage(with pageNum: Int,
                                          pageSize: Int,
                                          onSuccess: RKOnSuccess?,
                                          onFailed: RKOnFailed?)
    
    /// 设备用户设备信息上报
    /// - Parameters:
    ///   - registerId: 极光推送ID
    ///   - isSlam: 是否支持slam
    ///   - deviceType: 1-android  2-ios  3-pc  4-glass  5-web
    ///   - onSuccess: 成功回调
    ///   - onFailed: 失败回调
    @objc func reportDeviceInfo(with registerId: String?,
                                isSlam: Bool,
                                deviceType: Int,
                                onSuccess: RKOnSuccess?,
                                onFailed: RKOnFailed?)
    
}

@objcMembers
public class RKAPIManager: NSObject {}

