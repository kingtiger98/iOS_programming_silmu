//
//  DetailViewController.swift
//  MovieHwangjh
//
//  Created by 황재하 on 5/24/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    var movieName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = movieName
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
