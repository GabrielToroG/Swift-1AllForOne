//
//  SendDataBackwardsViewController.swift
//  Swift-1AllForOne
//
//  Created by Gabriel Toro on 12-07-22.
//

import UIKit

class SendDataBackViewController: UIViewController {

    @IBOutlet weak var pickColorButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SendDataBack2ViewController {
            vc.delegate = self
        }
    }
}

// MARK: - SendDataBack2Delegate
// Este Viewcontroller tiene la responsabilidad de definir la funcion hasSelected
extension SendDataBackViewController: SendDataBack2Delegate {
    /// Función que recibe la información del siguiente ViewController y la usa en este ViewController
    func hasSelected(_ color: UIColor) {
        self.dismiss(animated: true) {
            self.view.backgroundColor = color
        }
    }
}
