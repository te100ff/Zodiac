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
        assignbackground()
    }
    
    func assignbackground(){
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
    
    
}
