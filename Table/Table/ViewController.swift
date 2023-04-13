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
    
    // section 수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // section에서 row 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    // cell 생성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        // MyTableViewCell의 인스턴스에 접근하기 위해서 다운캐스팅 함 : as?
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? MyTableViewCell else {
            return UITableViewCell()
        }
        cell.myLabel.text = "재하"
        return cell
    }
}
