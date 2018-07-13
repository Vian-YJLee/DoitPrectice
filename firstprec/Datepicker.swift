//
//  Datepicker.swift
//  firstprec
//
//  Created by LeeYongJin on 09/07/2018.
//  Copyright © 2018 vian. All rights reserved.
//

import UIKit

class DatePicker: UIViewController {
    let timeSelector: Selector = #selector(DatePicker.updateTime)
    let interval = 1.0
    var count = 0
    
    
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!
    @IBOutlet weak var lblTimerCount: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblPickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date)
        
    }
    
    @objc func updateTime() {
        lblTimerCount.text = "타이머 카운터: " + String(count)
        count = count + 1
        //timer method
    }
    
    @objc func currentTime() {
        let date = NSDate()
        
        let formetter = DateFormatter()
        formetter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간: " + formetter.string(from: date as Date)
    }
}
