//
//  FaceView.swift
//  FaceIt1
//
//  Created by jwh on 2017. 3. 24..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit

@IBDesignable //스토리보드에 그린게바로보이게해줌 
class FaceView: UIView {
    
    @IBInspectable
    private var scale: CGFloat = 0.90 { didset { setNeedsDisplay() } }
    // 타입을 명시적으로 적어줘야 IBInspectable이 인식함
    //didset으로 값이 바뀌면 새로그려줌
    @IBInspectable
    var mouthCurvature: Double = 0.0
    @IBInspectable
    var eyeOpen: Bool = true
    @IBInspectable
    var eyeBrowTilt: Double = 0.0
    
    
    private var skullRadius: CGFloat{
        return min(bounds.size.width, bounds.size.height)/2 * scale
    }
    
    private var skullCenter: CGPoint{
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    //비율
    private struct Ratios{
        static let SkullRadiusToEyeOffset: CGFloat = 3
        static let SkullRadiusToEyeRadius: CGFloat = 10
        static let SkullRadiusToMouseWidth: CGFloat = 1
        static let SkullRadiusToMouseHeight: CGFloat = 3
        static let SkullRadiusToMouseOffset: CGFloat = 3
        static let SkullRadiusToBrowOffset: CGFloat = 5
    }
    
    private enum Eye {
        case Left
        case Right
    }
    
    private  func pathForCircleCenteredAtPoint(midPoint: CGPoint, withRadius radius: CGFloat) -> UIBezierPath {
        let path = UIBezierPath(
            arcCenter: midPoint,
            radius: radius,
            startAngle: 0.0,
            endAngle: CGFloat(2*M_PI),
            clockwise: false)
        path.lineWidth = 5.0;
        return path
        }
    
    private func getEyeCenter(_ eye: Eye)->CGPoint{
        let eyeOffSet = skullRadius / Ratios.SkullRadiusToEyeOffset
        var eyeCenter = skullCenter
        eyeCenter.y -= eyeOffSet
        switch eye{
        case .Left: eyeCenter.x -= eyeOffSet
        case .Right: eyeCenter.x += eyeOffSet
        }
        return eyeCenter
    }
    
    private func pathForMouth() -> UIBezierPath{
        let mouthWidth = skullRadius / Ratios.SkullRadiusToMouseWidth
        let mouthHeight = skullRadius / Ratios.SkullRadiusToMouseHeight
        let mouthOffset = skullRadius / Ratios.SkullRadiusToMouseOffset
        
        let mouthRect = CGRect(x: skullCenter.x - mouthWidth / 2, y: skullCenter.y + mouthOffset, width: mouthWidth, height: mouthHeight)
    
        let smileOffset = CGFloat(max(-1, min(mouthCurvature,1))) * mouthRect.height
        let start = CGPoint(x:mouthRect.minX,y:mouthRect.minY)
        let end = CGPoint(x:mouthRect.maxX,y:mouthRect.minY)
        let cp1 = CGPoint(x:mouthRect.minX + mouthRect.width/3,y:mouthRect.minY + smileOffset)
        let cp2 = CGPoint(x:mouthRect.maxX -  mouthRect.width/3,y:mouthRect.minY + smileOffset)
        
        let path =  UIBezierPath()
        path.move(to: start)
        path.addCurve(to: end, controlPoint1: cp1, controlPoint2: cp2)
        path.lineWidth = 5.0
        return path
    }
    
    private func pathForEye(_ eye: Eye) -> UIBezierPath{
        let eyeRadius = skullRadius / Ratios.SkullRadiusToEyeRadius
        let eyeCenter = getEyeCenter(eye)
        if(eyeOpen){
        return pathForCircleCenteredAtPoint(midPoint: eyeCenter, withRadius: eyeRadius)
        }else{
            let path = UIBezierPath()
            path.move(to: CGPoint(x: eyeCenter.x - eyeRadius, y: eyeCenter.y))
            path.addLine(to: CGPoint(x: eyeCenter.x + eyeRadius, y: eyeCenter.y))
            return path
        }
    }

//    private func pathForBrow(eye: Eye)->UIBezierPath{
//        var tilt = eyeBrowTilt
//        switch(eye){
//        case .Left: tilt *= -1.0
//        case.Right: break;
//     
//        
//        }
//    }
    override func draw(_ rect: CGRect) {
        UIColor.blue.set()
        pathForCircleCenteredAtPoint(midPoint: skullCenter, withRadius: skullRadius).stroke()
        pathForEye(.Left).stroke()
        pathForEye(.Right).stroke()
        pathForMouth().stroke()
    }
 

}
