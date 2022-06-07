//
//  ViewController.swift
//  Scene-Trans01
//
//  Created by 기태욱 on 2021/09/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func moveNext(_ sender: Any) {
        let uvc = self.storyboard!.instantiateViewController(identifier: "SecondVC")
        // 이동할 뷰 컨트롤러 객체를 스토리보드id 정보를 이용하여 참조.
        
        // UIStoryboard 초기화 과정에서 파일을 직접 지정
        //        let storyboard = UIStoryboard(name: "main", bundle : Bundle.main)
        //        let uvc = storyboard.instantiateViewController(identifier: "SecondVC")
        
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        // 화면 전환할 때의 애니매이션 타입
        
        self.present(uvc, animated: true)
        // 인자값으로 뷰 컨트롤러 인스턴스를 넣고 프레젠트 메소드 호출
    }
    
    //    if let uvc = self.storyboard?.instantiateViewController(identifier: "SecondVC"){
    //        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
    //
    //        self.present(uvc, animated: true)
    //    }
    // guard 구문을 사용하는게 BEST!
}

