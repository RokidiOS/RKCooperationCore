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
    ///   - params: 参数
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
    
    /// 创建会议
    /// - Parameters:
    ///   - resolutionRatio: 分辨率
    ///   - meetingName: 会议名称
    ///   - onSuccess: 成功回调
    ///   - onFailed: 失败回调
    @objc func createMeeting(with resolutionRatio: String?,
                             meetingName: String?,
                             onSuccess: RKOnSuccess?,
                             onFailed: RKOnFailed?)
    
    /// 获取用户信息
    /// - Parameters:
    ///   - onSuccess: 成功回调
    ///   - onFailed: 失败回调
    @objc func getUserInfo(onSuccess: RKOnSuccess?,
                           onFailed: RKOnFailed?)
    
    /// 分配license
    @objc func getCompanyLisence(onSuccess: RKOnSuccess?,
                                 onFailed: RKOnFailed?)
    /// 上报心跳
    @objc func heartBeat(lisence: String!,
                         onSuccess: RKOnSuccess?,
                         onFailed: RKOnFailed?)
    /// 通过会议ID查询会议
    /// - Parameters:
    ///   - meetingId: 会议ID
    ///   - onSuccess: 成功回调
    ///   - onFailed: 失败回调
    @objc func getMeeting(with meetingId: String!,
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
    /// 上传图片
    /// - Parameters:
    ///   - imgs: 图片数组
    ///   - onSuccess: 成功回调
    ///   - onFailed: 失败回调
    @objc func uploadImage(imgs: [UIImage],
                           onSuccess: RKOnSuccess?,
                           onFailed: RKOnFailed?)
    
    /// 获取二维码token
    /// - Parameters:
    ///   - onSuccess: 成功回调
    ///   - onFailed: 失败回调
    @objc func getUserBindToken(onSuccess: RKOnSuccess?,
                                onFailed: RKOnFailed?)
    /// 获取用户URL
    /// - Parameters:
    ///   - bucketName: 文件夹名字
    ///   - expireTime: 过期时间
    ///   - fileName: 文件名
    ///   - onSuccess: 成功回调
    ///   - onFailed: 失败回调
    @objc func getFileUrl(bucketName: String!,
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
    
    /// 新增会议参会人
    /// - Parameters:
    ///   - meetingId: 会议ID
    ///   - userIdList: 用户ID集
    ///   - sessionStatus: 成员会话状态 0:预创建会议 1，会议创建成功
    ///   - onSuccess: 成功回调
    ///   - onFailed: 失败回调
    @objc func saveMeetingUsers(with meetingId: String!,
                                userIdList:[String]!,
                                sessionStatus: Int,
                                onSuccess: RKOnSuccess?,
                                onFailed: RKOnFailed?)
    /// 删除会议参会人
    /// - Parameters:
    ///   - meetingId: 会议ID
    ///   - userIdList: 用户ID集
    ///   - onSuccess: 成功回调
    ///   - onFailed: 失败回调
    @objc func deleteMeetingUsers(with meetingId: String!,
                                  userIdList:[String]!,
                                  onSuccess: RKOnSuccess?,
                                  onFailed: RKOnFailed?)
    /// 上传录制会议视频
    /// - Parameters:
    ///   - meetingId: 会议ID
    ///   - bucket: 文件夹名字
    ///   - videoUrl: 视频路径
    ///   - onSuccess: 成功回调
    ///   - onFailed: 失败回调
    @objc func saveMeetingVideoUrl(with meetingId: String,
                                   bucket: String,
                                   videoUrl: String,
                                   onSuccess: RKOnSuccess?,
                                   onFailed: RKOnFailed?)
    
    /// 设备用户设备信息上报
    /// - Parameters:
    ///   - registerId: 极光推送ID
    ///   - deviceType: 1-android  2-ios  3-pc  4-glass  5-web
    ///   - onSuccess: 成功回调
    ///   - onFailed: 失败回调
    @objc func reportDeviceInfo(with registerId: String?,
                                deviceType: Int,
                                onSuccess: RKOnSuccess?,
                                onFailed: RKOnFailed?)
    
    /// 发送推送
    /// - Parameters:
    ///   - userIdList: 用户ID集
    ///   - notificationMessage: 配置项
    ///   - extraMap: 拓展参数
    ///   - onSuccess: 成功回调
    ///   - onFailed: 失败回调
    @objc func sendPushMessage(to userIdList: [String]?,
                               notificationMessage: [String: String],
                               extraMap: [String: String],
                               onSuccess: RKOnSuccess?,
                               onFailed: RKOnFailed?)
    
}

@objcMembers
public class RKAPIManager: NSObject {}

