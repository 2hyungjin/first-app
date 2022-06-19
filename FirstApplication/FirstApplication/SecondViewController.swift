//
//  SecondViewController.swift
//  FirstApplication
//
//  Created by 이형진 on 2022/06/19.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func popNaviagion(){
        self.navigationController?.popViewController(animated: true)
    }
    


}
