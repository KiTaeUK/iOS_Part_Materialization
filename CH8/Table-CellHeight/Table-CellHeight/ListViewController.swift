//
//  ListViewController.swift
//  Table-CellHeight
//
//  Created by 기태욱 on 2022/03/11.
//

import UIKit

class ListViewController : UITableViewController {
    
    var list = [String]()
    
    @IBAction func add(_ sender: Any){
        
        // 1) 알림창 객체의 인스턴스를 생성한다
        let alert = UIAlertController(title: "목록 입력", message: "추가될 글을 작성해주세요", preferredStyle: .alert)
        
        
        // 2) 알림창에 입력폼을 추가한다
        alert.addTextField(){ (tf) in
            tf.placeholder = "내용을 입력하세요"
        }
        
        // 3) OK버튼 객체를 생성한다, 아직 알림창 객체에 버튼이 등록되지 않은 상태
        let ok = UIAlertAction(title: "OK", style: .default) { (_) in
            
            // 4) 알림창의 0번째 입력필드에 값이 있다면
            if let title = alert.textFields?[0].text {
                
                // 5) 배열에 입력된 값을 추가하고 테이블을 갱신
                self.list.append(title)
                self.tableView.reloadData()
            }
        }
        
        // 취소 버튼 객체를 생성한다, 아직 알림창 객체에 버튼이 등록되지 않은 상태
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        // 6) 알림창 객체에 버튼 객체를 등록한다
        alert.addAction(ok)
        alert.addAction(cancel)
        
        // 7) 알림창을 띄운다
        self.present(alert, animated: false)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section : Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ talbleView : UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 1) "cell" 아이디를 가진 셀을 읽어온다. 없으면 UITableViewCell 인스턴스를 생성한다
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        
        
        // 추가된 부분 : 셀의 기본 텍스트 레이블 행 수 제한을 없엔다.
        cell.textLabel?.numberOfLines = 0
        
        
        // 2) 셀의 기본 텍스트 레이블에 배열 변수의 값을 할당
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = self.list[indexPath.row]
        
        
        let height = CGFloat(60 + (row.count / 30) * 2)

        
        return height
    }
    
    

}
