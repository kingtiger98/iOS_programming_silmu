//
//  DetailViewController.swift
//  MovieHwangjh
//
//  Created by 황재하 on 5/24/23.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var movieName: String = ""
    
    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // nameLabel.text = movieName
        navigationItem.title = movieName
        
        
        // 네이버 검색창 + 자동으로 영화이름으로 검색까지, url뒤에 해당 row의 movieName 추가
         let urlKorString = "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query="+movieName

        // let urlKorString = "https://namu.wiki/w/"+movieName
        // let urlKorString = "https://map.naver.com/v5/search/영화관"
        // .urlQueryAllowed : url에 한글이 있으면 퍼센트 인코딩을 해야 함.
        let urlString = urlKorString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
}
