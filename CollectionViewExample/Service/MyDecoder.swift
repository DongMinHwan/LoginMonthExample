//
//  MyDecoder.swift
//  CollectionViewExample
//
//  Created by DongMin Hwang on 2023/04/08.
//

import Foundation

class MyDecoder : JSONDecoder {
    
    override init() {
        super.init()
    }
    
    func decode<T>(_ type: T.Type, from: Any?) throws -> T where T: Decodable {
        let data = from as! Data
        print("data : \(data)")
        return try self.decode(type, from: data)
    }
}
