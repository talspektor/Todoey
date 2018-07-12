//
//  Category.swift
//  Todoey
//
//  Created by user140592 on 7/11/18.
//  Copyright © 2018 talspektor. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
    @objc dynamic var name : String = ""
    let items = List<Item>()//the forward relatianship
}
