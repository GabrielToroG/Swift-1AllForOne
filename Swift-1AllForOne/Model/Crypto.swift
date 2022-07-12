//
//  Crypto.swift
//  Swift-1AllForOne
//
//  Created by Gabriel Toro on 03-06-22.
//

import Foundation


//Se harian 2 archivos? Uno llamado Crypto y otro llamado Contact
class Welcome: Codable {
    var contacts: [Contact]?
}

class Contact: Codable {
    let id: String
    let name: String
    let email: String
}


