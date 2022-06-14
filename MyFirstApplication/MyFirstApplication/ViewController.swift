//
//  ViewController.swift
//  MyFirstApplication
//
//  Created by 이형진 on 2022/06/14.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var playButton : UIButton!
    @IBOutlet var timelabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpPlayButton(_ sender: UIButton) {
        print("button is pressed")
    }
    

}
