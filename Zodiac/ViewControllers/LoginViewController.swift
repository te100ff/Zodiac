//
//  LoginViewController.swift
//  Zodiac
//
//  Created by Stanislav Testov on 23.04.2021.
//

import UIKit
// MARK: - Protocol
protocol WelcomeViewControllerDelegate {
    func clearFields()
}

class LoginViewController: UIViewController {
    // MARK: - IB Outlets
    
    @IBOutlet var fieldLabels: [UILabel]!
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var birthdayTF: UITextField!
    
    @IBOutlet weak var okButton: UIButton!
    
    // MARK: - Private properties
    private let datePicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        okButton.layer.cornerRadius = okButton.frame.height/2
        okButton.alpha = 0.3
        // assignbackground()
        labelsSetup()
    }
    
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let person = Person(
            name: nameTF.text ?? "",
            lastName: lastNameTF.text ?? "",
            dayOfBirth: birthdayTF.text ?? "",
            dateOfBirth: datePicker.date
        )
        
        let tabVC = segue.destination as! UITabBarController
        
        guard let viewControlers = tabVC.viewControllers else { return }
//        Раскомментируйте область своего VC
        for viewController in viewControlers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.person = person
                welcomeVC.delegate = self
            } else if let aboutVC = viewController as? AboutViewController {
                aboutVC.person = person
            } else if let zodiacVC = viewController as? ZodiacViewController {
                zodiacVC.person = person
            }  else if let navigationVC = viewController as? UINavigationController {
                let friendsVC = navigationVC.topViewController as! FriendsTableViewController
//                friendsVC.person = person
            }
        }
    }
    
    
    @IBAction func okButtonPressed(_ sender: Any) {
        okPressed(textFields: nameTF, lastNameTF, birthdayTF)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let _ = segue.source as? WelcomeViewController else { return }
        nameTF.text = ""
    }
    
    // MARK: - Private methods (button pressed, alert)
    private func okPressed(textFields: UITextField... ) {
        textFields.forEach { textField in
            guard let text = textField.text, !text.isEmpty else {
                showAlert(title: "Внимание", message: "Заполните все поля")
                return
            }
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

// MARK: - Textfields and keyboards setup
extension LoginViewController: UITextFieldDelegate  {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing (_ textField: UITextField) {
        textFieldSetup(textField: textField)
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        var doneButton = UIBarButtonItem()
        
        switch textField {
        case nameTF, lastNameTF:
            doneButton = UIBarButtonItem(
                title: "Done",
                style: .done,
                target: textField,
                action: #selector(resignFirstResponder)
            )
        default:
            textField.inputView = datePicker
            datePicker.datePickerMode = .date
            datePicker.preferredDatePickerStyle = .wheels
            datePicker.locale = Locale(identifier: "ru_RU")
            
            doneButton = UIBarButtonItem(
                title: "Done",
                style: .done,
                target: nil,
                action: #selector(doneDatePressed)
            )
        }
        
        toolBar.items = [space, doneButton]
        
        textField.inputAccessoryView = toolBar
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.shadowOpacity = 0
        okButtonChange(textFields: nameTF, lastNameTF, birthdayTF)
    }
    
    
    @objc func doneDatePressed() {
        let formater = DateFormatter()
        formater.dateStyle = .long
        formater.timeStyle = .none
        formater.locale = Locale(identifier: "ru_RU")
        formater.setLocalizedDateFormatFromTemplate("MMMM d y")
        
        birthdayTF.text = formater.string(from: datePicker.date)
        view.endEditing(true)
    }
    
}

// MARK: - Graphics and effects setup
extension LoginViewController {
    private func okButtonChange(textFields: UITextField... ) {
        for textField in textFields {
            guard let text = textField.text, !text.isEmpty else { return }
            continue
        }
        okButton.layer.shadowOpacity = 1
        okButton.layer.shadowOffset = .zero
        okButton.layer.shadowRadius = 20
        okButton.layer.shadowColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        okButton.alpha = 1
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
    
    func labelsSetup() {
        for label in fieldLabels {
            label.layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            label.layer.shadowOpacity = 1
            label.layer.shadowRadius = 15
            label.layer.shadowOffset = .zero
        }
    }
    
    private func textFieldSetup(textField: UITextField) {
        textField.layer.shadowOpacity = 1
        textField.layer.shadowOffset = .zero
        textField.layer.shadowRadius = 10
        textField.layer.shadowColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
    }
    
}

extension LoginViewController: WelcomeViewControllerDelegate {
    func clearFields() {
        nameTF.text = ""
        lastNameTF.text = ""
        birthdayTF.text = ""       
    }
    
    
}
