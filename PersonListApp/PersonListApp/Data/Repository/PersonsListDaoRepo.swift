//
//  PersonsListDaoRepo.swift
//  PersonListApp
//
//  Created by Burak Aydın on 20.09.2023.
//

import Foundation
import RxSwift

class PersonsListDaoRepo {
    var personsList = BehaviorSubject<[Persons]>(value: [Persons] ())
    
    
    func save(person_name : String , person_phone : String) {
        print("save person : \(person_name) - \(person_phone)")
    }
    
    func update(person_id : Int , person_name : String , person_phone : String) {
        print("save person :  \(person_id) - \(person_name) - \(person_phone)")
    }
    
    func delete (person_id : Int) {
        print("person delete : \(person_id)")
        uploadsPersons()
    }
    
    func search(searchText: String) {
        print("search person : \(searchText)")
    }
    
    func uploadsPersons () {
        var persons = [Persons] ()
        
        let k1 = Persons(person_id: 1, person_name: "burak", person_phone: "123123")
        let k2 = Persons(person_id: 2, person_name: "nisa", person_phone: "234234")
        let k3 = Persons(person_id: 3, person_name: "tarik", person_phone: "345345")
        
        persons.append(k1)
        persons.append(k2)
        persons.append(k3)
        
        personsList.onNext(persons)
    }
    
}
