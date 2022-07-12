//
//  CryptoAPIViewController.swift
//  Swift-1AllForOne
//
//  Created by Gabriel Toro on 03-06-22.
//

import UIKit

class  APIConnectionViewController: UIViewController {

    let parser = Parser()
    override func viewDidLoad() {
        super.viewDidLoad()
        parser.parse()
    }


}

struct Parser {
    func parse() {
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
                
            }
        }.resume()
    }
}
