//
//  WelcomeViewController.swift
//  Zodiac
//
//  Created by Виталий Оранский on 23.04.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var welcomeText: UILabel!
    
    @IBOutlet weak var exitButton: UIButton!
    
    var person: Person!
    var delegate: WelcomeViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullNameLabel.text = person.fullName
        // Do any additional setup after loading the view.
    }
    

    @IBAction func exitButtonAction(_ sender: Any) {
        dismiss(animated: true)
        delegate.clearFields(fields: )
    }

}
