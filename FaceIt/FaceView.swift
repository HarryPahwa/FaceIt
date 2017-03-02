//
//  FaceView.swift
//  FaceIt
//
//  Created by Harry Pahwa on 2017-03-01.
//  Copyright © 2017 HarryPahwa. All rights reserved.
//

import UIKit

class FaceView: UIView {
    
    
    var scale: CGFloat=0.9
    
    private var skullCenter:CGPoint{
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
   
    private var skullRadius:CGFloat{
        return min(bounds.size.width, bounds.size.height)/2 * scale
    }
    
    private enum Eye {
        case left
        case right
    }
    
    private func pathForEye(_ eye:Eye) -> UIBezierPath {
        
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
        path.stroke()
    }
    
    private struct Ratios {
        static let skullRadiustoEyeOffset: CGFloat = 3
        static let skullRadiustoEyeRadius: CGFloat = 10
        static let skullRadiustoMouthWidth: CGFloat = 1
        static let skullRadiustoMouthHeight: CGFloat = 3
        static let skullRadiustoMouthOffset: CGFloat = 3
        
    }
}
