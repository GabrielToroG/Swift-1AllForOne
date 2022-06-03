//
//  SmartScreensViewController.swift
//  Swift-1AllForOne
//
//  Created by Gabriel Toro on 29-05-22.
//

import UIKit

//MARK: - 1 SmartScreensViewController
class SmartScreensViewController: UIViewController {
    
    
    //MARK: 1.3 Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK: 1.4 Actions
    @IBAction func blueAction(_ sender: Any) {
        performSegue(withIdentifier: "goToBlueFromSmart", sender: self)
    }
    
    @IBAction func greenAction(_ sender: Any) {
        performSegue(withIdentifier: "goToGreenFromSmart", sender: self)
    }
    
    @IBAction func orangeAction(_ sender: Any) {
        performSegue(withIdentifier: "goToOrangeFromSmart", sender: self)
    }
    
    
    //MARK: 1.6 Segue handlers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToBlueFromSmart"{          //Se identifica el segue
            if let destination = segue.destination as? SmartScreens2ViewController{
                destination.paramColor = "Brown"
            }
        }
        
        if segue.identifier == "goToGreenFromSmart"{          //Se identifica el segue
            if let destination = segue.destination as? SmartScreens2ViewController{
                destination.paramColor = "Green"
            }
        }
        
        if segue.identifier == "goToOrangeFromSmart"{          //Se identifica el segue
            if let destination = segue.destination as? SmartScreens2ViewController{
                destination.paramColor = "Orange"
            }
        }
    }
}
