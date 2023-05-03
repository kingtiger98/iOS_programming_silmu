//
//  ViewController.swift
//  MovieHwangjh
//
//  Created by 황재하 on 5/3/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet weak var table: UITableView!
    
    let name = ["슈퍼 마리오 브라더스", "드림", "존윅4", "스즈메의 문단속", "옥수역 귀신", "리바운드", "더 퍼스트 슬램덩크", "랜필드", "킬링 로맨스", "무명"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
        cell.movieName.text = name[indexPath.row]
        
        return cell
    }
}

