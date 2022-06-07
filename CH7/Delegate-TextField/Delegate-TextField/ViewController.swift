//
//  ViewController.swift
//  Delegate-TextField
//
//  Created by 기태욱 on 2022/02/17.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {    // 델리게이트 프로토콜에 대한 구현 선언

    @IBOutlet var tf: UITextField!
    
    override func viewDidLoad() {
        
        
        self.tf.placeholder = "값을 입력하세요"                            // 안내 메시지
        self.tf.keyboardType = UIKeyboardType.alphabet            // 키보드 타입 영문자 패드로
        self.tf.keyboardAppearance = UIKeyboardAppearance.dark  // 키보드 스타일 어둡게
        self.tf.returnKeyType = UIReturnKeyType.join              // 리턴 키타입 "Join"
        self.tf.enablesReturnKeyAutomatically = true              // 리턴키 자동 활성화 "On"
        
        
        self.tf.borderStyle = UITextField.BorderStyle.line          // 태두리 스타일 - 직선
        self.tf.backgroundColor = UIColor(white: 0.87, alpha: 1.0)  // 배경색상
        self.tf.contentVerticalAlignment = .center                   // 수직 방향으로 텍스트가 가운데 정렬
        self.tf.contentHorizontalAlignment = .center                 // 수평 방향으로 텍스트가 가운데 정렬
        
        self.tf.layer.borderColor = UIColor.darkGray.cgColor        // 테두리 색상을 회색으로 (텍스트 필드의 테두리 색상은 UIColor 보다 저수준인 CGColor 타입의 값을 사용하기 때문에 타입으로 변환해준거)
        self.tf.layer.borderWidth = 2.0                                 // 테두리 두께 설정(단위 : pt)
        // 위 두 속성은 텍스트 필드 자체의 속성이 아니라 하위 객체인 layer속성에 정의되어 있다 -> 따라서 layer속성을 거쳐서 참조하거나 설정해야함
        
        
        self.tf.becomeFirstResponder()
        
        
        self.tf.delegate = self
        // 델리게이트 지정
        // 텍스트 필드에 특정 이벤트가 발생했을 때 알려줄 대상 객체를 가르키는 속성
        // = 텍스트 필드에서 미리 정해진 특정 이벤트가 발생하면 현재의 뷰 컨트롤러에게 알려달라는 요청
    }


    @IBAction func confirm(_ sender: Any) {
        self.tf.resignFirstResponder()
    }
    
    @IBAction func input(_ sender: Any) {
        self.tf.becomeFirstResponder()
    }
    
    func textFieldShoudBeginEditing(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 편집이 시작됩니다")
        return true // false를 리턴하면 편집되지 않는다.
    }
    // 텍스트 필드의 편집이 시작된 후 호출
    
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool{
        print("텍스트 필드의 내용이 삭제됩니다")
        return true // false를 리턴하면 삭제되지 않는다.
    }
    // 텍스트 필드의 내용이 삭제될 때 호출
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        print("텍스트 필드의 내용이 \(string)으로 변경됩니다")
        if Int(string) == nil {
            return true // 입력된 값이 숫자가 아니라면 참 리턴
        } else{
            return false// 입력된 값이 숫자라면 거짓 리턴
        }
        //숫자를 입력할 수 없도록 차단
        
        //return true // false를 리턴하면 내용이 변경되지 않는다.
    }
    // 텍스트 필드의 내용이 변경될 때 호출
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        print("텍스트 필드의 리턴키가 눌러졌습니다.")
        return true
    }
    // 텍스트 필드의 리턴키가 눌려졌을 때 호출
    
    

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool{
        print("텍스트 필드의 편집이 종료됩니다.")
        return true // false를 리턴하면 편집이 종료되지 않는다
    }
    // 텍스트 필드 편집이 종료될 때 호출
    

    func textFieldDidEndEditing(_ textField: UITextField){
        print("텍스트 필드의 편집이 종료되었습니다.")
    }
    // 텍스트 필드의 편집이 종료되었을 때 호출
}


