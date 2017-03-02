//
//  ViewController.swift
//  FaceIt
//
//  Created by Harry Pahwa on 2017-03-01.
//  Copyright © 2017 HarryPahwa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var faceView: FaceView! {
        didSet{
            let handler = #selector(FaceView.changeScale(byReactingTo:))
            let pinchRecognizer = UIPinchGestureRecognizer(target: faceView, action:handler)
            faceView.addGestureRecognizer(pinchRecognizer)
            updateUI()
        }
    }
   
    var expression = FacialExpression(eyes: .Open, eyeBrows: .Relaxed, mouth: .Grin){
        didSet{
            updateUI()
        }
    }
    
    private func updateUI()
    {
        switch expression.eyes{
        case .Open:
            faceView?.eyesOpen=true
        case .Closed:
            faceView?.eyesOpen=false
        case .Squinting:
            faceView?.eyesOpen=false
        }
        
        faceView?.mouthCurvature = mouthCurvatures[expression.mouth] ?? 0.0
    }
    
    private let mouthCurvatures = [FacialExpression.Mouth.Grin:0.5, .Frown:-1.0, .Smile:1.0, .Neutral:0.0, .Smirk:-0.5]
    
}

