//
//  ViewController.swift
//  SubmitValue
//
//  Created by 기태욱 on 2022/01/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var email : UITextField!
    
    @IBOutlet var isUpdate : UISwitch!
    
    @IBOutlet var interval : UIStepper!     // 자동 갱신 여부를 설정하는 스위치
    
    @IBOutlet var isUpdateText : UILabel!
    
    @IBOutlet var intervalText : UILabel!

    
    @IBAction func onSwitch(_ sender: Any) {
        guard let obj = sender as? UISwitch else{
            return
        }
        if (obj.isOn == true){
            self.isUpdateText.text = "갱신함"
        } else {
            self.isUpdateText.text = "갱신하지 않음"
        }
    }
    // sender 매개변수가 Any 타입일 때 (다운 캐스팅) 옵셔널 캐스팅
    
    @IBAction func onStepper(_ sender: UIStepper) {
        let obj = sender as! UIStepper
        
        let value = Int(obj.value)
        self.intervalText.text = "\(value)분 마다"
    }
    // sender 매개변수가 Any 타입일 때 (다운 캐스팅) 강제 캐스팅

    
    @IBAction func onSubmit(_ sender: Any) {
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else {
            return
        }
        
        self.present(rvc, animated: true)
        
        let ad = UIApplication.shared.delegate as? AppDelegate
        // AppDelegate 객체의 인스턴스를 가져온다
        
        ad?.paramEmail = self.email.text
        ad?.paramUpdate = self.isUpdate.isOn
        ad?.paramInterval = self.interval.value
        // 값을 저장한다
    
    }

}
