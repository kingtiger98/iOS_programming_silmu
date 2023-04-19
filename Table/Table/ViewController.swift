//
//  ViewController.swift
//  Table
//
//  Created by 황재하 on 4/5/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let foods = ["1.김치찌개", "2.된장찌개", "3.떡볶이", "4.제육볶음", "5.돈가스"]
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    // 뷰 이동 소스 : present()
    @IBAction func presentBtn(_ sender: Any) {
        // 스토리보드 초기화
        let SecondVC = storyboard?.instantiateViewController(identifier: "SecondVC")
        // 트랜지션 방법 지정
        SecondVC?.modalPresentationStyle = .automatic
        // present사용!
        present(SecondVC!, animated: true)
    }
    
    // section 수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // section에서 row 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    // cell 생성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        // MyTableViewCell의 인스턴스에 접근하기 위해서 다운캐스팅 함 : as?
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? MyTableViewCell else {
            return UITableViewCell()
        }
        cell.myLabel.text = foods[indexPath.row]
        return cell
    }
}
