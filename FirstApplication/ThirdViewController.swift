//
//  ThirdViewController.swift
//  FirstApplication
//
//  Created by 이형진 on 2022/06/20.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    let dateFormatter : DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }()
    
    
    
    @IBAction func didDatePickerValueChanged(_ sender : UIDatePicker){
        let date: Date = sender.date
        let dateString = dateFormatter.string(from: date)
        
        dateLabel.text = dateString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func dismissModal(){
        dismiss(animated: true)
    }
    
    
}
