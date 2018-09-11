//
//  InputViewController.swift
//  StudyTimer
//
//  Created by madison on 12/19/17.
//  Copyright © 2017 MadisonFileman. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    var seconds = 0
    @IBOutlet weak var times: UIPickerView!
    let timeSource = [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23], [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59]];
    
    

    //HOW MANY COLUMNS
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    //NUMBER OF DATA
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return timeSource[component].count
    }
    
    //CONTENT
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return String(timeSource[component][row])
    }
    
    
    //PICK WHAT
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        if component == 0 {
            seconds += timeSource[0][row]*3600
        } else {
            seconds += timeSource[1][row]*60
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.times.dataSource = self;
        self.times.delegate = self;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ViewController
        {
            let vc = segue.destination as? ViewController
            vc?.totalSeconds = seconds
        }
    }
}
