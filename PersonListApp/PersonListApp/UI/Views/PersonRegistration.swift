//
//  PersonRegistration.swift
//  PersonListApp
//
//  Created by Burak Aydın on 18.09.2023.
//

import UIKit

class PersonRegistration: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNoTextField: UITextField!
    
    var viewModel = PersonsRegistrationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveButton(_ sender: Any) {
        if let person_name = nameTextField.text ,
           let person_phone = phoneNoTextField.text {
            viewModel.save(person_name: person_name, person_phone: person_phone)
        }
    }
    

}
