//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by 기태욱 on 2022/02/25.
//

import UIKit
import Foundation

class ListViewController : UITableViewController {
    
    @IBOutlet var moreBtn: UIButton!
    
    var page = 1
    
    lazy var list : [MovieVO] = []

    
    // 테이블 뷰를 구성할 리스트 데이터
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section : Int) -> Int {
        return self.list.count
    }
    // 생성해야할 행의 개수를 반환하는 메소드 (이 메소드가 반환하는 값만큼의 테이블 뷰 행을 생성)
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        // 주어진 행에 맞는 데이터 소스르 읽어온다
        let row = self.list[indexPath.row]
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        
        // 데이터 소스에 저장된 값을 각 아울렛 변수에 할당
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        
        
        
        // 썸네일 경로를 인자값으로 하는 URL객체 생성
        let url : URL! = URL(string: row.thumbnail!)
        
        // 이미지를 읽어와 Data 객체에 저장
        let imageData = try! Data(contentsOf: url)
        
        // UIImage 객체를 생성하여 아울렛 변수의 image 속성에 대입
        cell.thumbnail.image = UIImage(data:imageData)
        
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 번째 행입니다")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.estimatedRowHeight = 50
        self.tableView.rowHeight = UITableView.automaticDimension
        
    }
    
    
    override func viewDidLoad() {

        self.callMovieAPI()
    }
    
    
    @IBAction func more(_ sender: Any) {
        // 현재 페이지 값에 1을 추가한다
        self.page += 1
        
        // 영화차트 API를 호출한다
        self.callMovieAPI()
        
        // 데이터를 다시 읽어오도록 테이블 뷰를 갱신한다
        self.tableView.reloadData()
    }
    
    
    
    
    func callMovieAPI() {
        // 호핀 API 호출을 위한 URI 생성
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(self.page)&count=10&genreId=&order=releasedateasc"
    
        let apiURI : URL! = URL(string: url)
        
        
        // REST API를 호출
        let apidata = try! Data(contentsOf: apiURI)
        
        
        // 데이터 전송 결과를 로그로 출력
        let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? "데이터가 없습니다"
        
        NSLog("API Result = \( log )")
    
    
        // JSON 객체를 파싱하여 NSDictionay 객체로 변환
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            
            // 데이터 구조에 따라 차례대로 캐스팅하며 읽어온다
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            // Iterator 처리를 하면서 API 데이터를 MovieVO 객체에 저장한다
            for row in movie{
                let r = row as! NSDictionary
                
                // 테이블 뷰 리스트를 구성할 데이터 형식
                let mvo = MovieVO()
                
                // movie 배열의 각 데이터를 mvo 상수의 속성에 대입
                mvo.title = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.rating = ((r["ratingAverage"] as! NSString).doubleValue)
                
                // list 배열에 추가
                self.list.append(mvo)
            
                // 데이터를 다시 읽어오도록 테이블 뷰를 갱신한다
                self.tableView.reloadData()
                
                
                
                let totalCount = (hoppin["totalCount"] as? NSString)!.integerValue
                
                
                if (self.list.count >= totalCount){
                    self.moreBtn.isHidden = true
                }
            }
        } catch{
            NSLog("Parse Error!!")
        }
    }
}



