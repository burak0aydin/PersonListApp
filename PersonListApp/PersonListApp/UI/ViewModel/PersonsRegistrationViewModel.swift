//
//  PersonsRegistrationModel.swift
//  PersonListApp
//
//  Created by Burak Aydın on 20.09.2023.
//

import Foundation

class PersonsRegistrationViewModel {
    var personRepo = PersonsListDaoRepo()
    func save(person_name : String , person_phone : String) {
        personRepo.save(person_name: person_name, person_phone: person_phone)
    }
}
