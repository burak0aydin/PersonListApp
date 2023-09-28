//
//  PersonsDetailsViewModel.swift
//  PersonListApp
//
//  Created by Burak Aydın on 20.09.2023.
//

import Foundation

class PersonsDetailsViewModel {
    
    var personRepo = PersonsListDaoRepo()

    func update(person_id : Int , person_name : String , person_phone : String) {
        personRepo.update(person_id: person_id, person_name: person_name, person_phone: person_phone)
    }
}
