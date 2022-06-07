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
        let ad = UIApplication.shared.delegate as? AppDelegate
        
        if let email = ad?.paramEmail{
            resultEmail.text = email
        }
        
        if let update = ad?.paramUpdate{
            resultUpdate.text = update==true ? "자동갱신":"자동갱신안함"
        }
        if let interval = ad?.paramInterval {
            resultInterval.text = "\(Int(interval))"
        }
    }
    
    @IBAction func onBack(_ sender : Any){
        self.presentingViewController?.dismiss(animated: true)
    }
}
