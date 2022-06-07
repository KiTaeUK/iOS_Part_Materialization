//
//  ViewController.swift
//  Scene-ManualSegue
//
//  Created by 기태욱 on 2021/10/06.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func wind(_ sender: Any) {
        // 세그웨이를 실행한다
        self.performSegue(withIdentifier: "ManualWind", sender: self)
    }
}

