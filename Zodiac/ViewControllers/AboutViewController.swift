//
//  AboutViewController.swift
//  Zodiac
//
//  Created by Виталий Оранский on 23.04.2021.
//  Edited by Noskov Philip on 24.04.2021

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet var aboutUserCollection: [UILabel]!
    @IBOutlet var aboutUserCollectionInfo: [UILabel]!
    
    @IBOutlet weak var zodiacImageView: UIImageView!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension AboutViewController {
    
    private func setupUi() {
        informationLabel.text = person.fullName
    }
}
