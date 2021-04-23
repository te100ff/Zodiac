//
//  AboutViewController.swift
//  Zodiac
//
//  Created by Виталий Оранский on 23.04.2021.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet var aboutUserCollection: [UILabel]!
    @IBOutlet var aboutUserCollectionInfo: [UILabel]!
    
    @IBOutlet weak var zodiacImageView: UIImageView!
    
    
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
