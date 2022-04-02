//
//  RKMessageCenter.swift
//  Pods
//
//  Created by Rokid on 2021/11/12.
//

import Foundation
import RKILogger

extension RKMessageCenter: RKMessageInterface {
    
    static var channelMsgListeners: NSHashTable = NSHashTable<AnyObject>(options: .weakMemory)
    
    public static func addChannelMsg(listener: RKChannelMsgListener,
                                     channelId: String) {
            channelMsgListeners.add(listener)
    }
    
    public static func removeChannelMsg(listener: RKChannelMsgListener,
                                        channelId: String) {
            channelMsgListeners.remove(listener)
    }
    
    public static func sendChannelMessage(_ message: String) {
        
        guard let channel = RKRTCManager.shared.rtcChannel,
              channel.channelId.isEmpty == false else {
            return
        }
        
        RKRTCManager.shared.sendChannelMessage(content: message)
        
    }
    
    // MARK: - 收到会议内消息统一分发
    static func channelMessageReceived(_ channelId: String, message: String) {
        
        RKLog("channelMessageReceived channelId:\(channelId)\n message:\(message)")
        
        if let list: [RKChannelMsgListener] = channelMsgListeners.allObjects as? [RKChannelMsgListener] {
            
            list.forEach { listener in
                if let msg = RKMessage.deserialize(from: message) {
                    listener.onChannelMsgReceive(fromUserId: msg.fromUserId, content: message)
                }
            }
        }
    }
}
