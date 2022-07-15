//
//  MainViewController.swift
//  Swift-1AllForOne
//
//  Created by Gabriel Toro on 19-05-22.
//

import UIKit

//MARK: - 1 MainViewController
class MainViewController: UIViewController {

    
    //MARK: 1.1 Outlets
    @IBOutlet weak var navegationTableView: UITableView!
    
    
    //MARK: 1.2 Variables
    //Se crea un arreglo
    var cellsArray = [
        ["title": "Mandar información hacia adelante", "icon": "ic_main_send_data"],
        ["title": "Mandar información hacia atrás", "icon": "ic_main_send_data"],
        ["title": "Formulario con desplegables", "icon": "ic_main_send_data"],
        ["title": "Pantallas inteligentes", "icon": "ic_main_smart_screens"],
        ["title": "Carrusel", "icon": "ic_main_carousel"],
        ["title": "Conexión API", "icon": "ic_main_api"],
        ["title": "Modal", "icon": "ic_main_modal"],
    ]
    
    
    //MARK: 1.3 Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViews()
    }
    
    
    //MARK: 1.5 UI Functions
    func loadViews(){
        //Table View
        navegationTableView.rowHeight = 44      //Fija la altura de la celda a la de default
        navegationTableView.dataSource = self   //Indica los elementos que tendrá la tabla
        navegationTableView.delegate = self     //Indica las acciones de cada celda
    }
}


//MARK: - 2 Extension: DataSource
extension MainViewController: UITableViewDataSource{
    // A. Función que establece cuantas celdas tendrá la tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsArray.count
    }
    
    // B. Función que establece cual es el contenido de cada una de las celdas
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = navegationTableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        cell.tableName.text = cellsArray[indexPath.row]["title"]!
        cell.tableIcon.image = UIImage(named: cellsArray[indexPath.row]["icon"]!)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}


//MARK: - 3 Extension: Delegate
extension MainViewController: UITableViewDelegate{
    // A. Función que establece la acción que ocurrirá al hacer clic en una celda
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)    //Se des-selecciona la celda
        
        //Se hacen las distintas conexiones dependiendo del elemento de la tabla
        switch indexPath.row{
        case 0:
            performSegue(withIdentifier: "goToSendDataFromMain", sender: self)
        case 1:
            performSegue(withIdentifier: "goToSendDataBackFromMain", sender: self)
        case 2:
            performSegue(withIdentifier: "goToFormFromMain", sender: self)
        case 3:
            performSegue(withIdentifier: "goToCarouselFromMain", sender: self)
        case 4:
            performSegue(withIdentifier: "goToCryptoFromMain", sender: self)
        case 5:
            performSegue(withIdentifier: "goToModalFromMain", sender: self)
        default:
            print("hola")
        }
    }
}
