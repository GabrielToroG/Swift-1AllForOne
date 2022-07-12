//
//  SendDataViewController.swift
//  Swift-1AllForOne
//
//  Created by Gabriel Toro on 23-05-22.
//

import UIKit


class SendDataViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var colorTableView: UITableView!
 
    
    // MARK: - Variables
    private var saveColor: ColorStruct = ColorStruct()
    private let colors: [ColorStruct] = [
            ColorStruct(color: .systemRed, text: "Rojo"),
            ColorStruct(color: .systemGreen, text: "Verde"),
            ColorStruct(color: .systemYellow, text: "Amarrillo"),
            ColorStruct(color: .systemOrange, text: "Naranjo")
    ]

    
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
    
    
    // MARK: - Segue handlers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RecieveColorViewController{
            destination.paramColor = saveColor.color
            destination.paramText = saveColor.text
        }
    }
}



// MARK: Extensions
extension SendDataViewController: UITableViewDataSource {
    // 1. Función que establece cuantas celdas tendrá la tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    // 2. Función que establece cual es el contenido de cada una de las celdas
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = colorTableView.dequeueReusableCell(withIdentifier: "SendDataTableViewCell", for: indexPath) as! SendDataTableViewCell
        cell.colorView.backgroundColor = colors[indexPath.row].color
        cell.colorLabel.text = colors[indexPath.row].text
        return cell
    }
}

extension SendDataViewController: UITableViewDelegate {
    // 1. Función que establece la acción que ocurrirá al hacer clic en una celda
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)    // Se des-selecciona la celda
        
        // A continuación, se respalda la data, para luego enviarla al siguiente vc
        saveColor.color = colors[indexPath.row].color
        saveColor.text = colors[indexPath.row].text
        
        // Se genera la conexión con el siguiente vc, mediante el segue
        performSegue(withIdentifier: "goToRecieveColorFromSendData", sender: self)
    }
}
