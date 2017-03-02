//
//  FaceView.swift
//  FaceIt
//
//  Created by Harry Pahwa on 2017-03-01.
//  Copyright © 2017 HarryPahwa. All rights reserved.
//

import UIKit

class FaceView: UIView {
    
    
    var scale: CGFloat = 0.9
    var eyesOpen: Bool = false
    
    private var skullCenter: CGPoint{
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    private var skullRadius: CGFloat{
        return min(bounds.size.width, bounds.size.height)/2 * scale
    }
    
    private enum Eye {
        case left
        case right
    }
    
    private func pathForEye(_ eye:Eye) -> UIBezierPath {
        func centerOfEye(_ eye: Eye) -> CGPoint {
            let eyeOffset=skullRadius/Ratios.skullRadiustoEyeOffset
            var eyeCenter=skullCenter
            eyeCenter.y-=eyeOffset
            eyeCenter.x+=((eye == .left) ? -1 : 1) * eyeOffset
            return eyeCenter
        }
        let eyeRadius=skullRadius/Ratios.skullRadiustoEyeRadius
        let eyeCenter=centerOfEye(eye)
        let path:UIBezierPath
        if eyesOpen {
            path = UIBezierPath(arcCenter: eyeCenter, radius: eyeRadius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        } else {
            path=UIBezierPath()
            path.move(to: CGPoint(x: eyeCenter.x - eyeRadius, y: eyeCenter.y))
            path.addLine(to: CGPoint(x: eyeCenter.x + eyeRadius, y: eyeCenter.y))
        }
        return path
    }
    
    
    private func pathForSkull() -> UIBezierPath
    {
        let path=UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: false)
        path.lineWidth=5.0
        return path
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        
        UIColor.blue.set()
        pathForSkull().stroke()
        pathForEye(.left).stroke()
        eyesOpen = true
        pathForEye(.right).stroke()
    }
    
    private struct Ratios {
        static let skullRadiustoEyeOffset: CGFloat = 3
        static let skullRadiustoEyeRadius: CGFloat = 10
        static let skullRadiustoMouthWidth: CGFloat = 1
        static let skullRadiustoMouthHeight: CGFloat = 3
        static let skullRadiustoMouthOffset: CGFloat = 3
        
    }
}
