//
//  RKUserInterface.swift
//  RKCooperationCore
//
//  Created by Amos on 2022/4/29.
//

import Foundation
@objc public protocol RKUserInterface: NSObjectProtocol {
    /// 用户ID
    @objc var userId: String { get set }
    /// 公司ID
    @objc var companyId: String? { get set }
    /// 用户名
    @objc var userName: String? { get set }
    /// 姓名
    @objc var realName: String? { get set }
    /// 手机号
    @objc var phone: String? { get set }
    /// 头像
    @objc var avatar: String? { get set }
}
