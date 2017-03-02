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
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(toggleEyes(byReactingTo:)))
            tapRecognizer.numberOfTapsRequired=1
            faceView.addGestureRecognizer(tapRecognizer)
            let swipeUpRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(decreaseHappiness))
            swipeUpRecognizer.direction = .up
            faceView.addGestureRecognizer(swipeUpRecognizer)
            let swipeDownRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(increaseHappiness))
            swipeDownRecognizer.direction = .down
            faceView.addGestureRecognizer(swipeDownRecognizer)
            updateUI()
        }
    }
    
    func increaseHappiness()
    {
        expression = expression.happier
    }
    
    func decreaseHappiness()
    {
        expression = expression.sadder
    }
   
    func toggleEyes(byReactingTo tapRecognizer: UITapGestureRecognizer) {
        if tapRecognizer.state == .ended {
            let eyes: FacialExpression.Eyes = (expression.eyes == .Closed) ? .Open: .Closed
            expression = FacialExpression(eyes: eyes, eyeBrows: expression.eyeBrows, mouth: expression.mouth)
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

