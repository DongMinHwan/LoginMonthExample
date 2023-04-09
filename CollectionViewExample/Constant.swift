//
//  Constant.swift
//  CollectionViewExample
//
//  Created by DongMin Hwang on 2023/04/08.
//

import Foundation

class Constant {
    static let isDev: Bool = true
    
    struct API {
        static var url : String {
            return "https://firebasestorage.googleapis.com/v0/b/rxswiftin4hours.appspot.com/o/fried_menus.json?alt=media&token=42d5cb7e-8ec4-48f9-bf39-3049e796c936"
        }
    }
    
    static let PORT_PICKCAST = isDev ? "" : ":8081"
    
    static let URL_PICKCAST_MAIN_LIST = API.url + PORT_PICKCAST + "/pickcast/main"
}
