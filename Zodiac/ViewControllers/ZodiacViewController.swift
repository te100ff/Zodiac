//
//  ZodiacViewController.swift
//  Zodiac
//
//  Created by Zodiac crew on 23.04.2021.
//

import UIKit

class ZodiacViewController: UIViewController {
    
    @IBOutlet weak var zodiacLabel: UILabel!
    @IBOutlet weak var zodiacDescriptionTextView: UITextView!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backlightLabel(for: zodiacLabel)
        zodiacLabel.text = "Ваш знак - \(person.zodiac.rawValue)"
        zodiacDescriptionTextView.text = person.zodiacDiscription
        setBackground()
    }
    
    private func setBackground(){
        let background = UIImage(named: "stars")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    private func backlightLabel(for label: UILabel) {
        label.layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.layer.shadowOpacity = 1
        label.layer.shadowRadius = 15
        label.layer.shadowOffset = .zero
    }
    
}
