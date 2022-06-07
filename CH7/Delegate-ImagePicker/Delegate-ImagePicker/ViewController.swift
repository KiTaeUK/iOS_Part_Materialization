//
//  ViewController.swift
//  Delegate-ImagePicker
//
//  Created by 기태욱 on 2022/02/24.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet var imgView: UIImageView!
    
    @IBAction func pick(_ sender: Any) {
        let picker = UIImagePickerController()
        // 이미지 피커 컨트롤러 인스턴스 생성
        
        picker.sourceType = .photoLibrary   // 이미지 소스로 라이브러리 선택
        picker.allowsEditing = true          // 이미지 편집 기능 ON
        
        picker.delegate = self                // 델리게이트 지정
        
        self.present(picker, animated: false)
        // 이미지 피커 컨트롤러 실행
    }
    

}

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    // 이미지 피커에서 이미지를 선택하지 않고 취소했을 때 호출되는 메소드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // 이미지 피커 컨트롤러 창 닫기
        self.dismiss(animated: false) { ( ) in
            //알림창 호출
            let alert = UIAlertController(title: "", message: "이미지 선택이 취소되었습니다", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
            self.present(alert, animated: false)
        }
    }
    
    // 이미지 피커에서 이미지를 선택했을 때 호출되는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 이미지 피커 컨트롤러 창 닫기
        picker.dismiss(animated: false) { () in
            // 이미지를 이미지 뷰에 표시
            let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            self.imgView.image = img
        }
    }
}
