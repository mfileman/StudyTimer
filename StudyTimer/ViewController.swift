//
//  ViewController.swift
//  StudyTimer
//
//  Created by madison on 11/3/17.
//  Copyright © 2017 MadisonFileman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var timerLabel: UILabel!          //will show time counting down
    
    var totalSeconds = 0 // stores what the user inputted for total amount of study time
    lazy var seconds = totalSeconds // lazy indicates that its initial value isnt set until it is first used, to be used for editable seconds

    
    override func viewDidLoad() {
        timerLabel.text = timeString(time: TimeInterval(seconds)) // sets the label to inital value 
    }

    var timer = Timer()
    var timerIsRunning = false // timer isnt running rn

    
//START BUTTON
    @IBAction func startButton(sender: UIButton) {
        runTimer()
    }
    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,
                                     selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        timerIsRunning = true // when touched, the timer will start running
    }
    
    @objc func updateTimer(){
        if seconds < 1 {
            
            timer.invalidate()
            let alertController = UIAlertController(title: "Timer Done", message: "", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
        else {
            
            seconds -= 1
            timerLabel.text = timeString(time: TimeInterval(seconds))
        }
    }
    
    
    
//PAUSE BUTTON
    @IBAction func pauseButton(sender: UIButton) {
        if self.timerIsRunning == true { //if the button is hit and the timer is running...
            timer.invalidate()          //pause it
            self.timerIsRunning = false //and then the timer isnt running
        } else {
            runTimer()
            self.timerIsRunning = true
        }
    }
    
    
    
    
// RESET BUTTON
    @IBAction func resetButton(sender: UIButton) {
        timer.invalidate()                  //stop it
        seconds = totalSeconds
        timerLabel.text = timeString(time: TimeInterval(seconds))
        
    }
    
    
    
//FORMATTING
    func timeString( time: TimeInterval ) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time)/60 % 60
        let second = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, second)
    }
    
   
    
    
    
    
    
    
    
    
    
    

}

