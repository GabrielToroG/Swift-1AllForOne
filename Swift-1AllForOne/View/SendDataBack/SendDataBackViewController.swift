//
//  SendDataBackwardsViewController.swift
//  Swift-1AllForOne
//
//  Created by Gabriel Toro on 12-07-22.
//

import UIKit

class SendDataBackViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var pickColorButton: UIButton!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    // MARK: - Segue handlers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let sendColorVC = segue.destination as? SendColorViewController {
            sendColorVC.delegate = self
        }
    }
}



// MARK: Extensions
/// Este Viewcontroller tiene la responsabilidad de definir la funcion hasSelected
extension SendDataBackViewController: SendColorDelegate {
    /// Función que recibe la información del siguiente ViewController y la usa en este ViewController
    func hasSelected(_ color: UIColor) {
        self.dismiss(animated: true) {
            self.view.backgroundColor = color
        }
    }
}
