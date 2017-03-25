//
//  Person.swift
//  hello-vapor
//
//  Created by Missy Allan on 3/25/17.
//
//

import Foundation
import Vapor


final class Person: Model {

    var id: Node?
    var personID: String?
    var exists: Bool = false

    var name: String
    var favCity: String
    
    init(name: String, favCity: String) {
        self.name = name
        self.favCity = favCity
        
    }
    
    init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        name = try node.extract("name")
        favCity = try node.extract("favCity")
      
        
    }
    
    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "id": id,
            "name": name,
            "favCity": favCity
            
            ])
       }
    
    
    static func prepare(_ database: Database) throws {
        try database.create("persons"){ persons in
            persons.id()
            persons.string("name")
            books.string("favCity")
      
        }
    }
    
    
    
    
    
 
}
