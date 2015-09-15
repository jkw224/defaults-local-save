//
//  Person.swift
//  defaults-local-save
//
//  Created by Jonathan Wood on 9/14/15.
//  Copyright © 2015 Jonathan Wood. All rights reserved.
//

import Foundation

class Person: NSObject, NSCoding {
    var firstName: String!
    var lastName: String!
    
    init(first:String, last:String) {
        firstName = first
        lastName = last
    }
    
    override init() {
        
    }
    
    // Decode objects
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self.firstName = aDecoder.decodeObjectForKey("firstName") as? String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as? String
    }
    
    // Specify which objects to encode
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstName, forKey: "firstName")
        aCoder.encodeObject(self.lastName, forKey: "lastName")
    }
}

