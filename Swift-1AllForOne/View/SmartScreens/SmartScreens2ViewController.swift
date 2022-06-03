//
//  SmartScreens2ViewController.swift
//  Swift-1AllForOne
//
//  Created by Gabriel Toro on 29-05-22.
//

import UIKit

//MARK: - 1 SmartScreens2ViewController
class SmartScreens2ViewController: UIViewController {

    
    //MARK: 1.1 Outlets
    @IBOutlet var fullScreen: UIView!
    
    
    //MARK: 1.2 Variables
    var paramColor: String?
    
    
    //MARK: 1.3 Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViews()
    }
    
    
    //MARK: 1.5 UI Functions
    func loadViews(){
        switch paramColor {
            case "Brown":
                fullScreen.backgroundColor = .systemBrown
            case "Green":
                fullScreen.backgroundColor = .systemGreen
            case "Orange":
                fullScreen.backgroundColor = .systemOrange
            default:
                print("fin")
        }
    }
}
