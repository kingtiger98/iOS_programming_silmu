//
//  ViewController.swift
//  MovieHwangjh
//
//  Created by 황재하 on 5/3/23.
//

import UIKit

// 구조체 생성
struct MovieData: Codable {
    let boxOfficeResult: BoxOfficeResult
}

// MARK: - BoxOfficeResult
struct BoxOfficeResult: Codable {
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

// MARK: - DailyBoxOfficeList
struct DailyBoxOfficeList: Codable {
    let movieNm, audiAcc: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    let name = ["슈퍼 마리오 브라더스", "드림", "존윅4", "스즈메의 문단속", "옥수역 귀신", "리바운드", "더 퍼스트 슬램덩크", "랜필드", "킬링 로맨스", "무명"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        // 네트워킹 함수 호출
        getData()
    }
    
    // MovieData형 프로퍼티 만들어 decodedData 저장
    var movieData: MovieData? // tableView(_:cellForRowAt:)에서 decodeData를 사용하기 위해
    let movieURL = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=e0d922798fe4b71963bb0052e9c4ad6b&targetDt=20230508"
    
    // 네트워킹 함수 총 4단계
    func getData() {
        // 네트워킹 1단계 : URL 만들기
        if let url = URL(string: movieURL){ // 네트워크로 접속할 주소
            // 네트워킹 2단계 : URLSession 만들기
            let session = URLSession(configuration: .default)
            // 네트워킹 3단계 : URLSession 인스턴스에게 task주기
            // 네트워킹 4_1단계 : 3단계를 상수 task에 넣음
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let JSONdata = data {
                    // JSONDecoder : JSON객체에서 데이터 타입의 인스턴스를 디코딩하는 객체 생성
                    let decorder = JSONDecoder()
                    // do~try~catch문으로 에러 핸들링
                    do {
                        let decodedData = try decorder.decode(MovieData.self, from: JSONdata)
                        self.movieData = decodedData // tableView(_:cellForRowAt:)에서 decodeData를 사용하기 위해
                        DispatchQueue.main.async { // UI관련 소스는 메인 스레드에서 처리하도록 해야함!
                            self.table.reloadData()
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            // 네트워킹 4_2단계 : task를 resume()
            task.resume()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
        cell.movieName.text = movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].movieNm
        cell.audiAcc.text = movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].audiAcc
        
        return cell
    }
}

