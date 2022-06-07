//
//  SecondViewController.swift
//  SubmitValue
//
//  Created by 기태욱 on 2022/01/20.
//

import UIKit

class ResultViewController : UIViewController {
    
    @IBOutlet var resultEmail: UILabel!
    
    @IBOutlet var resultUpdate: UILabel!
    
    @IBOutlet var resultInterval: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        let ud = UserDefaults.standard
        
        if let email = ud.string(forKey: "email"){
            resultEmail.text = email
        }
        
        let update = ud.bool(forKey: "isUpdate")
        resultUpdate.text = (update == true ? "자동갱신" : "자동갱신안함")
                             
        let interval = ud.double(forKey: "interval")
        resultInterval.text = "\(Int(interval))분마다"
    }
    
    @IBAction func onBack(_ sender : Any){
        self.presentingViewController?.dismiss(animated: true)
    }
}
