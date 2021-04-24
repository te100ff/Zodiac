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
        // Do any additional setup after loading the view.
    }
    
    private func setupOutlets() {
        friendNameLabel.text = friend.fullName
        friendBirthday.text = friend.dayOfBirth
        friendZodiac.text = "\(friend.zodiacEmoji) \(friend.fullName)"
        
        zodiacDescrtiptionTextView.text = friend.zodiacDiscription
    }
}


