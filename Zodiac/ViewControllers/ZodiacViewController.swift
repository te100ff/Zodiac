//
//  ZodiacViewController.swift
//  Zodiac
//
//  Created by Виталий Оранский on 23.04.2021.
//

import UIKit

class ZodiacViewController: UIViewController {
    
    @IBOutlet weak var zodiacLabel: UILabel!
    @IBOutlet weak var zodiacDescriptionTextView: UITextView!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zodiacLabel.text = "Вы \(person.zodiac.rawValue)"
        zodiacDescriptionTextView.text = person.zodiacDiscription
        
    }
    

    

}
