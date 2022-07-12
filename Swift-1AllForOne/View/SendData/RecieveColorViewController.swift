//
//  RecieveColorViewController.swift
//  Swift-1AllForOne
//
//  Created by Gabriel Toro on 12-07-22.
//

import UIKit

class RecieveColorViewController: UIViewController {

    // MARK: - Variables
    var paramColor: UIColor?
    var paramText: String?
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViews()
    }

    
    // MARK: - UI Functions
    /// Función que hace toda la vista se vea como se tienen que ver
    private func loadViews() {
        view.backgroundColor = paramColor
    }
}
