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
    
    @IBAction func touchUpShowAlertButton(){
        showAlert()
    }
    func showAlert(){
        let alertController:UIAlertController = UIAlertController(title: "Alert", message: "Message", preferredStyle: .alert)
        let cancelAction:UIAlertAction = UIAlertAction(title: "cancle", style: .cancel, handler: nil)
        let defaultAction:UIAlertAction = UIAlertAction(title: "default", style: .default, handler: {_ in print("click default")})
        
        alertController.addAction(cancelAction)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}
