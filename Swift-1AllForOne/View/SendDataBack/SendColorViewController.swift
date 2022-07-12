//
//  SendDataBack2ViewController.swift
//  Swift-1AllForOne
//
//  Created by Gabriel Toro on 12-07-22.
//

import UIKit

// Un protocolo es un instancia donde se declaran variables o funciones, pero no se implementan
protocol SendColorDelegate {
    func hasSelected(_ color: UIColor)
}


/// Comentario: El modo popup se dió en el Storyboard, revisar
class SendColorViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var colorTableView: UITableView!
    
    
    // MARK: - Variables
    private let colors: [ColorStruct] = [
            ColorStruct(color: .systemRed, text: "Rojo"),
            ColorStruct(color: .systemGreen, text: "Verde"),
            ColorStruct(color: .systemYellow, text: "Amarrillo"),
            ColorStruct(color: .systemOrange, text: "Naranjo")
    ]
    var delegate: SendColorDelegate? // Variable necesaria en la clase que desencadenar el evento
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViews()
    }
    
    
    // MARK: - UI Functions
    /// Función que hace toda la vista se vea como se tienen que ver
    private func loadViews() {
        colorTableView.dataSource = self
        colorTableView.delegate = self
    }
}



// MARK: Extensions
extension SendColorViewController: UITableViewDataSource {
    // 1. Función que establece cuantas celdas tendrá la tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    // 2. Función que establece cual es el contenido de cada una de las celdas
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = colorTableView.dequeueReusableCell(withIdentifier: "SendColorTableViewCell", for: indexPath) as! SendColorTableViewCell
        cell.colorView.backgroundColor = colors[indexPath.row].color
        cell.colorLabel.text = colors[indexPath.row].text
        return cell
    }
}

extension SendColorViewController: UITableViewDelegate {
    // 1. Función que establece la acción que ocurrirá al hacer clic en una celda
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)    //Se des-selecciona la celda
        delegate?.hasSelected(colors[indexPath.row].color!) // Se devuelve la celda seleccionada, mediante el delegate
    }
}
