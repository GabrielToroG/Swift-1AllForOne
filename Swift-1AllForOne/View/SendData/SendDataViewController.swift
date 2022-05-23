//
//  SendDataViewController.swift
//  Swift-1AllForOne
//
//  Created by Gabriel Toro on 23-05-22.
//

import UIKit

//MARK: - 1 SendDataViewController
class SendDataViewController: UIViewController {

    
    //MARK: 1.1 Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    //MARK: 1.2 Variables
    var paramTitle: String?  //Variable que se recibirá por parámetros
    
    
    //MARK: 1.3 Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViews()
    }
    
    
    //MARK: 1.5 UI Functions
    //A. Función que carga las vistas
    func loadViews(){
        titleLabel.text        = paramTitle
        descriptionLabel.text  = "Pantalla donde se recibe el siguiente parametro por pantalla: \(paramTitle!)"
    }
}
