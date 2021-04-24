//
//  AboutViewController.swift
//  Zodiac
//
//  Created by Виталий Оранский on 23.04.2021.
//  Edited by Noskov Philip on 24.04.2021

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var informationLabel: UILabel!
    
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var personLastName: UILabel!
    @IBOutlet weak var personDateOfBirth: UILabel!
    @IBOutlet weak var personZodiac: UILabel!
    
    
    @IBOutlet weak var zodiacImageView: UIImageView!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        assignbackground()
    }
    
}

extension AboutViewController {
    
    private func setupUI() {
        
        informationLabel.text = person.fullName
        personName.text = person.name
        personLastName.text = person.lastName
        personDateOfBirth.text = person.dayOfBirth
        personZodiac.text = person.zodiac.rawValue
        
        zodiacImageView.image = UIImage(named: String(person.zodiacEmoji))
        
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
