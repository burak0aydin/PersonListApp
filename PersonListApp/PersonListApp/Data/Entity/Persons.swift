//
//  Persons.swift
//  PersonListApp
//
//  Created by Burak Aydın on 18.09.2023.
//

import UIKit

class Persons {
    var person_id : Int?
    var person_name : String?
    var person_phone : String?
    
    init(){
    }
    
    init(person_id: Int? = nil, person_name: String? = nil, person_phone: String? = nil) {
        self.person_id = person_id
        self.person_name = person_name
        self.person_phone = person_phone
    }


}
