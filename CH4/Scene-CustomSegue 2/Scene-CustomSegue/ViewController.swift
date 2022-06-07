//
//  ViewController.swift
//  Scene-CustomSegue
//
//  Created by 기태욱 on 2022/01/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender : Any?){
        if (segue.identifier == "custom_segue"){
            NSLog("Custom Segue will show")
        } else if (segue.identifier == "action_segue"){
            NSLog("Action Sgue will show")
        } else{
            NSLog("알수 없는 세그입니다.")
        }
    }
    
    @IBAction func UnwindToVC(_ sender : UIStoryboardSegue){
        // custom segue 일때는 안되네? 체크해보기
    }
}
