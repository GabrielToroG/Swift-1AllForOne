//
//  SendDataBack2ViewController.swift
//  Swift-1AllForOne
//
//  Created by Gabriel Toro on 12-07-22.
//

import UIKit

// Un protocolo es un instancia donde se declaran variables o funciones, pero no se implementan
protocol SendDataBack2Delegate {
    func hasSelected(_ color: UIColor)
}

// MARK: - SendDataBack2ViewController
/// Comentario: El modo popup se dió en el Storyboard, revisar
class SendDataBack2ViewController: UIViewController {
    
    // MARK: 1.1 Outlets
    @IBOutlet weak var colorTableView: UITableView!
    
    
    // MARK: 1.2 Variables
    let colors: [UIColor] = [.systemRed, .systemGreen, .systemYellow, .systemOrange]
    let textColors = ["Rojo", "Verde", "Amarrillo", "Naranjo"]
    var delegate: SendDataBack2Delegate? // Variable necesaria en la clase que desencadenar el evento
    
    
    // MARK: 1.3 Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViews()
    }
    
    
    // MARK: 1.5 UI Functions
    func loadViews() {
        colorTableView.dataSource = self
        colorTableView.delegate = self
    }
}


// MARK: - Extensions
extension SendDataBack2ViewController: UITableViewDataSource {
    //A. Función que establece cuantas celdas tendrá la tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    //B. Función que establece cual es el contenido de cada una de las celdas
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = colorTableView.dequeueReusableCell(withIdentifier: "SendDataBack2TableViewCell", for: indexPath) as! SendDataBack2TableViewCell
        cell.colorView.backgroundColor = colors[indexPath.row]
        cell.colorLabel.text = textColors[indexPath.row]
        return cell
    }
}

extension SendDataBack2ViewController: UITableViewDelegate {
    //A. Función que establece la acción que ocurrirá al hacer clic en una celda
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)    //Se des-selecciona la celda
        delegate?.hasSelected(colors[indexPath.row]) // Se devuelve la celda seleccionada, mediante el delegate
    }
}
