//
//  SecondViewController.swift
//  Table
//
//  Created by 황재하 on 4/17/23.
//

import UIKit

class SecondViewController: UIViewController {

    // 첫 번째 뷰로 돌아기가 위한 버튼 소스
    @IBAction func dismissBtn(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
