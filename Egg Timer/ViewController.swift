//
//  ViewController.swift
//  Egg Timer
//
//  Created by Joann Kuo on 11/30/17.
//  Copyright © 2017 Joann Kuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    
    var timeRemaining : Int {
        get {
            return Int(countdown.text!) ?? -1
        }
        set(value) {
            let oldValue = timeRemaining
            if (oldValue == value) {
                return
            }
            countdown.text = String(value)
            countdown.sizeToFit()
            if value == 0 {
                let anim = CABasicAnimation(keyPath: "transform.rotation")
                anim.fromValue = 0
                anim.toValue = -Float.pi
                anim.duration = 0.5
                anim.isRemovedOnCompletion = false
                anim.fillMode = kCAFillModeBoth
                eggTop.layer.add(anim, forKey:"anim")
            } else if value < 8 {
                let anim = CABasicAnimation(keyPath: "position.y")
                anim.isAdditive = true
                anim.fromValue = 0
                anim.toValue = -10
                anim.duration = 0.02
                anim.repeatCount = .infinity
                anim.autoreverses = true
                eggTop.layer.add(anim, forKey: "anim")
            } else {
                eggTop.layer.removeAnimation(forKey: "anim")
            }

        }
    }
    
    var isPaused = true



    @objc func eggTimer() {
        
        if timeRemaining > 0 {
            
            print("a second has passed and \(timeRemaining) is left")
            
            timeRemaining -= 1
        }
    }
    @IBAction func pause(_ sender: Any) {
        
        
        
        timer.invalidate()
            
        isPaused = true
        
        print("You have paused the timer")
        
    }
    
    
    @IBAction func play(_ sender: Any) {
        
        if timeRemaining > 0 && isPaused {
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.eggTimer), userInfo: nil, repeats: true)

            
            isPaused = false
        
            print("You have resumed the timer")
            
        } else {
            
            timer.invalidate()
            isPaused = true
            
        }
        
    }
    
    @IBAction func minusTen(_ sender: Any) {
        
        if timeRemaining >= 10 {
        
        timeRemaining -= 10
        print("-10 sec and \(timeRemaining) is left")
            
        }
        
    }
    
    @IBAction func addTen(_ sender: Any) {
        
        if timeRemaining <= 200 {
        
        timeRemaining += 10
        
        print("+10 sec and \(timeRemaining) is left")
        
        }

    }
    
    @IBAction func reset(_ sender: Any) {
        
        timeRemaining = 210
        
    }
    
    @IBOutlet weak var countdown: UILabel!
    
    @IBOutlet weak var eggTop: UIImageView!
    @IBOutlet weak var eggBottom: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.eggTimer), userInfo: nil, repeats: true)
        
        let w = eggTop.frame.width / 5
        let h = eggTop.frame.height
        let m1 = h / 2
        let m2 = m1 + 20
        do {
            let p = UIBezierPath()
            
            p.move(to: CGPoint(x: 0, y: 0))
            p.addLine(to: CGPoint(x:0, y:m2))
            p.addLine(to: CGPoint(x:w, y:m1))
            p.addLine(to: CGPoint(x:2 * w, y:m2))
            p.addLine(to: CGPoint(x:3 * w, y:m1))
            p.addLine(to: CGPoint(x:4 * w, y:m2))
            p.addLine(to: CGPoint(x:5 * w, y:m1))
            p.addLine(to: CGPoint(x:5 * w, y:0))
            p.close()
            let sl = CAShapeLayer()
            sl.path = p.cgPath;
            eggTop.layer.mask = sl
            eggTop.layer.anchorPoint = CGPoint(x: 0.082, y: m1/h)
        }
        
        do {
            let p = UIBezierPath()
            p.move(to: CGPoint(x: 0, y: m2))
            p.addLine(to: CGPoint(x:w, y:m1))
            p.addLine(to: CGPoint(x:2*w, y:m2))
            p.addLine(to: CGPoint(x:3*w, y:m1))
            p.addLine(to: CGPoint(x:4*w, y:m2))
            p.addLine(to: CGPoint(x:5*w, y:m1))
            p.addLine(to: CGPoint(x:6*w, y:h))
            p.addLine(to: CGPoint(x: 0, y: h))
            p.close()
            let sl = CAShapeLayer()
            sl.path = p.cgPath;
            eggBottom.layer.mask = sl
            eggBottom.layer.anchorPoint = eggTop.layer.anchorPoint
        }
        reset(0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

