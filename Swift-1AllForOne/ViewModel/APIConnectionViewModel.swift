//
//  APIConnectionViewModel.swift
//  Swift-1AllForOne
//
//  Created by Gabriel Toro on 05-06-22.
//

import Foundation

class APIConnectionViewModel {
    
    //MARK: Variables
    
    //MARK: Internal Functions
    func connection() {
        let api = URL(string: "https://api.androidhive.info/contacts/")
        URLSession.shared.dataTask(with: api!) { data, response, error in
            if error != nil {
                print(error?.localizedDescription as Any)
                return
            }
            do {
                let result = try JSONDecoder().decode(Welcome.self, from: data!)
                print(result)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
