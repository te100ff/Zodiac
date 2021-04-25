//
//  FriendsTableViewController.swift
//  Zodiac
//
//  Created by Zodiac crew on 23.04.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    private var friends = Person.getFriends()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackground()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friend", for: indexPath)
        
        let friend = friends[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.textProperties.font = UIFont(name: "Futura", size: 25)!
        content.textProperties.color = .white
        content.text = "\(friend.zodiacEmoji) \(friend.fullName)"
        cell.contentConfiguration = content
        cell.backgroundColor = .clear
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let aboutFriendVC = segue.destination as? AboutFriendViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let friend = friends[indexPath.row]
        aboutFriendVC.friend = friend
        
    }
    
    private func setBackground() {
        let image = UIImage(named: "stars")
        let imageView = UIImageView(image: image)
        tableView.backgroundView = imageView
    }
    
}
