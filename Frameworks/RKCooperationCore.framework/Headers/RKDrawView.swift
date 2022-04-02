//
//  RKDrawView.swift
//  RKCooperationCore
//
//  Created by Rokid on 2022/1/14.
//

import UIKit
import RKILogger

@objc public protocol RKDrawViewDelegate: NSObjectProtocol {
    ///  添加点位标注
    /// @param point 标注信息
    @objc func touchPointAction(_ pointAction: RKDoodle)
    
    /// 添加曲线标注
    /// @param doodle 标注信息
    @objc func addWireDoodleAction(_ doodle: RKDoodle)
}

public class RKDrawView: UIView {
    
    fileprivate var drawViewDelegates: NSHashTable = NSHashTable<AnyObject>(options: .weakMemory)

    /// 线宽
    public var lineWidth: CGFloat = 1.0
    /// 线条颜色
    public var lineColor: UIColor = .clear
    /// 存储路径
    public lazy var paths: [RKDrawPath] = []
    
    public override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
    }
    
    public required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    }
    
    public func addDrawViewDelegate(_ delegate: RKDrawViewDelegate) {
        drawViewDelegates.add(delegate)
    }
    
    public func removeDrawViewDelegate(_ delegate: RKDrawViewDelegate) {
        drawViewDelegates.remove(delegate)
    }

    public override func draw(_ rect: CGRect) {
        
        for line in paths {
            line.drawPath()
        }
    }
    
    public func getTouches(touches:Set<UITouch>) -> CGPoint {
        
        return (touches.first?.location(in: self))!
        
    }
    
    /// 开始画线
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let nPoint = getTouches(touches: touches)
        
        let path = RKDrawPath.path(beginPoint: nPoint,
                                   pathWidth: lineWidth,
                                   pathColor: lineColor)
        
        let doodle = RKDoodle(action: .add,
                              brushColor: lineColor,
                              brushWidth: Float(lineWidth / self.bounds.size.width))
        path.doodle = doodle
        
        let logicPoint = logicFromNormal(point: nPoint)
        let point = RKPoint()
        point.x = Float(logicPoint.x)
        point.y = Float(logicPoint.y)
        doodle.points.append(point)
        
        path.doodle?.points.append(point)
        
        paths.append(path)
        
        setNeedsDisplay()
        
        guard let delegates = drawViewDelegates.allObjects as? [RKDrawViewDelegate] else {
            return
        }
        
        delegates.forEach { delegate in
            delegate.touchPointAction(doodle)
        }
    }
    /// 正在画线
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let nPoint = getTouches(touches: touches)
        
        let path = paths.last
        
        path?.bezierPath?.addLine(to: nPoint)
        
        let logicPoint = logicFromNormal(point: nPoint)
        let point = RKPoint()
        point.x = Float(logicPoint.x)
        point.y = Float(logicPoint.y)
        
        path?.doodle?.points.append(point)
        
        setNeedsDisplay()
        
    }
    
    /// 结束画线
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        touchesMoved(touches, with: event)
        
        guard let path = paths.last,
              let doodle = path.doodle else {
                  return
              }
        
        guard let delegates = drawViewDelegates.allObjects as? [RKDrawViewDelegate] else {
            return
        }
        
        delegates.forEach { delegate in
            delegate.addWireDoodleAction(doodle)
        }
    }
    
    // 添加笔画
    public func add(_ doodles: [RKDoodle]) {
        
        guard doodles.isEmpty == false else { return }
        
        doodles.forEach { doodle in
            
            if doodle.points.count > 0 {
                
                let firstPoint = normalFromLogic(positionX: CGFloat(doodle.points.first!.x),
                                                 positionY: CGFloat(doodle.points.first!.y))
                
                let path = RKDrawPath.path(beginPoint: firstPoint,
                                           pathWidth: CGFloat(doodle.brushWidth) * self.bounds.width,
                                           pathColor: UIColor.init(hexColor: doodle.brushColor))
                
                path.doodle = doodle
                
                doodle.points.forEach { point in
                    
                    let normalPoint = normalFromLogic(positionX: CGFloat(point.x),
                                                      positionY: CGFloat(point.y))
                    
                    path.bezierPath?.addLine(to: normalPoint)
                    
                }
                
                paths.append(path)
                
            }
            
        }
        
        setNeedsDisplay()
        
    }
    
    // 清除画板
    public func clean() {
        
        paths.removeAll()
        
        setNeedsDisplay()
        
    }
    
    // 撤销
    public func undo(_ doodle: RKDoodle) {
        
        guard doodle.actionType == .revoke else { return }
        
        var tempPaths: [RKDrawPath] = []
        paths.forEach { path in
            if doodle.doodleId != path.doodle?.doodleId {
                tempPaths.append(path)
            }
        }
        
        paths = tempPaths
        
        setNeedsDisplay()
        
    }
    
    // 保存到相册
    public func save() {
        
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0);
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        self.layer.render(in: context)
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return };
        
        UIGraphicsEndImageContext();
        
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.imageSavedToPhotosAlbum(image:didFinishSavingWithError:contextInfo:)), nil);
        
    }
    
    @objc func imageSavedToPhotosAlbum(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: AnyObject) {
        if let error = error {
            RKLog("保存失败" + error.description)
        } else {
            RKLog("保存成功")
        }
    }
    
    // 屏幕的坐标转换成归一化的逻辑坐标
    func logicFromNormal(point: CGPoint) -> CGPoint {
        let size = self.bounds.size
        let x = 2 * point.x / size.width - 1.0
        let y = 2 * point.y / size.height - 1.0
        return CGPoint(x: x, y: y)
    }
    
    // 归一化的逻辑坐标转换成屏幕的坐标
    func normalFromLogic(positionX: CGFloat, positionY: CGFloat) -> CGPoint {
        let size = self.bounds.size
        let nX = (positionX + 1.0) * size.width / 2
        let nY = (positionY + 1.0) * size.height / 2
        return CGPoint(x: nX, y: nY)
    }
    
}

public class RKDrawPath: UIBezierPath {
    
    var doodle: RKDoodle?
    
    var bezierPath: UIBezierPath?
    
    var pathColor: UIColor?
    
    class func path(beginPoint: CGPoint, pathWidth: CGFloat, pathColor: UIColor) -> RKDrawPath {
        
        let path = RKDrawPath()
        path.pathColor = pathColor
        
        let bezier = UIBezierPath()
        bezier.lineCapStyle = CGLineCap.round
        bezier.lineJoinStyle = CGLineJoin.round
        bezier.lineWidth = pathWidth
        bezier.move(to: beginPoint)
        path.bezierPath = bezier
        return path
    }
    
    func drawPath() {
        
        pathColor?.set()
        
        bezierPath?.stroke()
        
    }
}
