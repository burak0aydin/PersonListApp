//
//  PersonDetails.swift
//  PersonListApp
//
//  Created by Burak Aydın on 18.09.2023.
//

import UIKit

class PersonDetails: UIViewController {
    
    @IBOutlet weak var nameDetailsTextField: UITextField!
    @IBOutlet weak var phoneNoDetailsTextField: UITextField!
    
    var viewMoedel = PersonsDetailsViewModel()
    
    var person : Persons?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let personClass = person {
            nameDetailsTextField.text = personClass.person_name
            phoneNoDetailsTextField.text = personClass.person_phone
        }

    }

    @IBAction func updateButton(_ sender: Any) {
        if let personClass = person,
           let person_name = nameDetailsTextField.text ,
           let person_phone = phoneNoDetailsTextField.text
            
        {
            viewMoedel.update(person_id: personClass.person_id!, person_name: person_name, person_phone: person_phone)
            
            
        }
    }
    
}
