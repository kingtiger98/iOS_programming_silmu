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
    let movieNm, audiAcc, audiCnt: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        // 네트워킹 함수 호출
        getData()
    }
    
    // MovieData형 프로퍼티 만들어 decodedData 저장
    var movieData: MovieData? // tableView(_:cellForRowAt:)에서 decodeData를 사용하기 위해
    var movieURL = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=e0d922798fe4b71963bb0052e9c4ad6b&targetDt="
    
    // 어제 날짜로 movieURL 자동 갱신
    func updateMovieURLAndGetData() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date()) // 어제의 날짜 계산
        let targetDate = dateFormatter.string(from: yesterday!)
        movieURL += targetDate
    }
    
    // 네트워킹 _ guard문으로 적용
    func getData() {
        updateMovieURLAndGetData() // movieURL에 어제 날짜 추가 함수 호출
        guard let url = URL(string: movieURL) else {
            print("Invalid URL") // 유효하지 않은 URL인 경우 에러 메시지 출력
            return
        }
        
        let session = URLSession(configuration: .default) // 기본 URLSession 구성
        
        let task = session.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return } // 클로저 내에서 self를 사용하기 위해 강한 참조를 약한 참조로 변환
            
            if let error = error {
                print(error) // 에러가 있는 경우 에러 메시지 출력
                return
            }
            
            guard let jsonData = data else {
                print("No data received") // 데이터가 없는 경우 에러 메시지 출력
                return
            }
            
            let decoder = JSONDecoder() // JSON을 디코딩하기 위한 JSONDecoder 생성
            
            do {
                let decodedData = try decoder.decode(MovieData.self, from: jsonData) // JSON 데이터 디코딩
                self.movieData = decodedData // 디코딩된 데이터를 속성에 저장
                
                DispatchQueue.main.async {
                    self.table.reloadData() // 메인 스레드에서 UI 업데이트를 수행하기 위해 reloadData() 호출
                }
            } catch {
                print(error) // 디코딩 에러가 있는 경우 에러 메시지 출력
            }
        }
        
        task.resume() // 네트워크 작업 시작
    }

    
    // String형 숫자에 콤마 추가 기능 함수
    func formatNumber(_ number: String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale.current
        formatter.groupingSeparator = ","
        
        guard let formattedNumber = formatter.number(from: number) else { return "nil" }
        return formatter.string(from: formattedNumber) ?? "실패"
    }
    
    // 테이블뷰 헤더
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date()) // 어제의 날짜 계산
        let targetDate = dateFormatter.string(from: yesterday!)
        return "박스오피스(영화진흥위원회재공 :" + targetDate + ")"
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
        
        guard let movie = movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row] else {
            cell.movieName.text = ""
            cell.audiAcc.text = ""
            cell.audiCnt.text = ""
            
            return cell
        }
            cell.movieName.text = movie.movieNm
            cell.audiAcc.text = "누적 : \(formatNumber(movie.audiAcc))"
            cell.audiCnt.text = "어제 : \(formatNumber(movie.audiCnt))"
        
            return cell
    }
    
    
    
    // 다음 뷰에 데이터 전달 기능
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // destination프로퍼티는 segue의 목적지에 접근할 수 있는 프로퍼티
        // 우리가 접근하려는 movieName은 UIViewController의 자식인 DetailViewController의 프로퍼티이므로
        // as!나 as?로 down casting해야 함, 부모 인스턴스를 자식 클래스로 변환하는 것!
        guard let dest = segue.destination as? DetailViewController else { return }
        
        // 어떤 row를 눌렀는지 알기위해 indexPathForSelectedRow프로퍼티로 확인!
        guard let selectRow = table.indexPathForSelectedRow else { return }
        let row = selectRow.row
        
        // movieName에 값 대입!
        dest.movieName = (movieData?.boxOfficeResult.dailyBoxOfficeList[row].movieNm)!
    }
    
}

// 네트워킹 함수 총 4단계
//    func getData() {
//        // 네트워킹 1단계 : URL 만들기
//        if let url = URL(string: movieURL){ // 네트워크로 접속할 주소
//            // 네트워킹 2단계 : URLSession 만들기
//            let session = URLSession(configuration: .default)
//            // 네트워킹 3단계 : URLSession 인스턴스에게 task주기, 네트워킹 4_1단계 : 3단계를 상수 task에 넣음
//            let task = session.dataTask(with: url) { data, response, error in
//                if error != nil {
//                    print(error!)
//                    return
//                }
//                if let JSONdata = data {
//                    // JSONDecoder : JSON객체에서 데이터 타입의 인스턴스를 디코딩하는 객체 생성
//                    let decorder = JSONDecoder()
//                    // do~try~catch문으로 에러 핸들링
//                    do {
//                        let decodedData = try decorder.decode(MovieData.self, from: JSONdata)
//                        self.movieData = decodedData // tableView(_:cellForRowAt:)에서 decodeData를 사용하기 위해
//                        DispatchQueue.main.async { // UI관련 소스는 메인 스레드에서 처리하도록 해야함!
//                            self.table.reloadData()
//                        }
//                    } catch {
//                        print(error)
//                    }
//                }
//            }
//            // 네트워킹 4_2단계 : task를 resume()
//            task.resume()
//        }
//    }
