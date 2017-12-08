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
    
    var timeRemaining = Int(210)
    
    var isPaused = true



   @objc func eggTimer() {
    
    countdown.text = String(timeRemaining)

    if timeRemaining > 0 {
        
        print("a second has passed and \(timeRemaining) is left")
    
        timeRemaining -= 1
        
        }
    
    }
    
    @IBAction func pause(_ sender: Any) {
        
        
        countdown.text = String(timeRemaining)
        
        timer.invalidate()
            
        isPaused = true
        
        print("You have paused the timer")
        
    }
    
    
    @IBAction func play(_ sender: Any) {
        
        if timeRemaining > 0 && isPaused {
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.eggTimer), userInfo: nil, repeats: true)

            countdown.text = String(timeRemaining)
            
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
        countdown.text = String(timeRemaining)
        print("-10 sec and \(timeRemaining) is left")
            
        }
        
    }
    
    @IBAction func addTen(_ sender: Any) {
        
        if timeRemaining <= 200 {
        
        timeRemaining += 10
        
        countdown.text = String(timeRemaining)
        
        print("+10 sec and \(timeRemaining) is left")
        
        }

    }
    
    @IBAction func reset(_ sender: Any) {
        
        timeRemaining = 210
        countdown.text = String(timeRemaining)
        
    }
    
    @IBOutlet weak var countdown: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.eggTimer), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

