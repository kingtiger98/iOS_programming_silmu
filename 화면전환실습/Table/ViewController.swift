//
//  ViewController.swift
//  Table
//
//  Created by 황재하 on 4/5/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        let SecondVC1 = storyboard?.instantiateViewController(identifier: "SecondVC")
        // 트랜지션 방법 지정
        SecondVC1?.modalPresentationStyle = .automatic
        // present사용!
        present(SecondVC1!, animated: true)
    }
    
    
    // 뷰 이동 소스 : 네비게이션 컨트롤러
    @IBAction func navigationBtn(_ sender: UIButton) {
        // 스토리보드 초기화
        guard let SecondVC2 = storyboard?.instantiateViewController(identifier: "SecondVC") else { return }
        // 네비게이션 컨트롤러 사용
        navigationController?.pushViewController(SecondVC2, animated: true)
    }
    
    
    
    @IBAction func segueBtn(_ sender: UIButton) {
        
    }
    
    
    
    
    
    // section 수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // section에서 row 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    // cell 생성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        // MyTableViewCell의 인스턴스에 접근하기 위해서 다운캐스팅 함 : as?
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? MyTableViewCell else {
            return UITableViewCell()
        }
        cell.myLabel.text = "첫 번째 테이블"
        return cell
    }
}
