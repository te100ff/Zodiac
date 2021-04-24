//
//  AboutFriendViewController.swift
//  Zodiac
//
//  Created by Виталий Оранский on 23.04.2021.
//

import UIKit

class AboutFriendViewController: UIViewController {
    
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var friendBirthday: UILabel!
    @IBOutlet weak var friendZodiac: UILabel!
    
    @IBOutlet weak var zodiacDescrtiptionTextView: UITextView!
    
    var friend: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOutlets()
        assignbackground()
    }
    
    private func setupOutlets() {
        friendNameLabel.text = friend.fullName
        friendBirthday.text = friend.dayOfBirth
        friendZodiac.text = "\(friend.zodiacEmoji) \(friend.zodiac.rawValue)"
        
        zodiacDescrtiptionTextView.text = friend.zodiacDiscription
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


