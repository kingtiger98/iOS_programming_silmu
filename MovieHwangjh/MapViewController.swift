//
//  MapViewController.swift
//  MovieHwangjh
//
//  Created by 황재하 on 6/7/23.
//

import UIKit
import WebKit

class MapViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네이버 검색창 + 자동으로 영화이름으로 검색까지, url뒤에 해당 row의 movieName 추가
         let urlKorString = "https://map.naver.com/v5/search/영화관"

        // let urlKorString = "https://namu.wiki/w/"+movieName
        // let urlKorString = "https://map.naver.com/v5/search/영화관"
        // .urlQueryAllowed : url에 한글이 있으면 퍼센트 인코딩을 해야 함.
        let urlString = urlKorString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
