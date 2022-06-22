//
//  DetailViewController.swift
//  FirstApplication
//
//  Created by 이형진 on 2022/06/22.
//

import UIKit

class DetailViewController: UIViewController {
    var text : String?
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textLabel.text=text
    }
    
    
}
