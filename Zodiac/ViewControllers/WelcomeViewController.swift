//
//  WelcomeViewController.swift
//  Zodiac
//
//  Created by Zodiac crew on 23.04.2021.
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
        
        backlightLabel(for: fullNameLabel)
        fullNameLabel.text = "Привет, \(person.fullName)!"
        setBackground()
        shadowSetup(element: fullNameLabel, radius: 20)
        shadowSetup(element: welcomeText, radius: 15)
        
    }
    
    
    @IBAction func exitButtonAction(_ sender: Any) {
        dismiss(animated: true)
        delegate.loginReturnSetup()
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
    
    private func shadowSetup(element: UIView, radius: CGFloat) {
        element.layer.shadowOpacity = 1
        element.layer.shadowRadius = radius
        element.layer.shadowOffset = .zero
    }
    
    private func backlightLabel(for label: UILabel) {
        label.layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.layer.shadowOpacity = 1
        label.layer.shadowRadius = 15
        label.layer.shadowOffset = .zero
    }
}
