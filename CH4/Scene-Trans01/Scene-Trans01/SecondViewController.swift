//
//  SecondViewController.swift
//  Scene-Trans01
//
//  Created by 기태욱 on 2021/09/14.
//

import UIKit

class SecondViewController: UIViewController{
    
    @IBAction func Back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
