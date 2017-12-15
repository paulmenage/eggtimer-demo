//
//  ViewController.swift
//  egg
//
//  Created by Paul Menage on 12/1/17.
//  Copyright © 2017 Paul Menage. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let v = UILabel(frame: CGRect(x:100, y:100, width:100, height:100))
        v.backgroundColor = UIColor.red
        v.text = "EGG"
        v.textAlignment = .center
        
           do {
        let p = UIBezierPath()
        p.move(to: CGPoint(x: 0, y: 0))
        p.addLine(to: CGPoint(x:0, y:100))
        p.addLine(to: CGPoint(x:20, y:80))
        p.addLine(to: CGPoint(x:40, y:100))
        p.addLine(to: CGPoint(x:60, y:80))
        p.addLine(to: CGPoint(x:80, y:100))
        p.addLine(to: CGPoint(x:100, y:80))
        p.addLine(to: CGPoint(x:100, y:0))
        p.close()
        let sl = CAShapeLayer()
        sl.path = p.cgPath;
                v.layer.mask = sl
        }
        v.layer.anchorPoint = CGPoint(x:0, y:1)
       self.view.addSubview(v)
        
        
        let v2 = UILabel(frame: CGRect(x:100, y:200, width:100, height:100))
        v2.backgroundColor = UIColor.red
        v2.text = "EGG"
        v2.textAlignment = .center
        
           do {
        let p = UIBezierPath()
        p.move(to: CGPoint(x: 0, y: 20))
        p.addLine(to: CGPoint(x:20, y:0))
        p.addLine(to: CGPoint(x:40, y:20))
        p.addLine(to: CGPoint(x:60, y:0))
        p.addLine(to: CGPoint(x:80, y:20))
        p.addLine(to: CGPoint(x:100, y:0))
        p.addLine(to: CGPoint(x:100, y:100))
            p.addLine(to: CGPoint(x: 0, y: 100))
        p.close()
        let sl = CAShapeLayer()
        sl.path = p.cgPath;
            v2.layer.mask = sl
        }
        self.view.addSubview(v2)
        v2.layer.anchorPoint = CGPoint(x: 0, y: 0.2)
        v2.center = v.center
        
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        anim.fromValue = 0
        anim.toValue = -Double.pi 
        anim.duration = 4
        anim.autoreverses = true
        anim.repeatCount = 10000
        v.layer.add(anim, forKey: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

