//
//  MainPageViewModel.swift
//  PersonListApp
//
//  Created by Burak Aydın on 20.09.2023.
//

import Foundation
import RxSwift

class MainPageViewModel {
    var personRepo = PersonsListDaoRepo()
    var personsList = BehaviorSubject<[Persons]>(value: [Persons] ())
    
    
    init () {
        personsList = personRepo.personsList
        uploadsPersons()
    }

    func delete (person_id : Int) {
        personRepo.delete(person_id: person_id)
    }
    
    func search(searchText: String) {
        personRepo.search(searchText: searchText)
    }
    
    func uploadsPersons () {
        personRepo.uploadsPersons()
    }
}
