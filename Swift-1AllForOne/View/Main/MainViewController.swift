//
//  MainViewController.swift
//  Swift-1AllForOne
//
//  Created by Gabriel Toro on 19-05-22.
//

import UIKit

//MARK: 1 MainViewController
class MainViewController: UIViewController {

    
    //MARK: 1.1 Outlets
    @IBOutlet weak var navegationTableView: UITableView!
    
    
    //MARK: 1.2 Variables
    //Se crea un arreglo
    var cellsArray = [
        ["title": "Mandar data", "icon": "ic_main_send_data"],
        ["title": "XDD", "icon": "ic_main_send_data"],
        ["title": "Carrusel", "icon": "ic_main_carousel"],
//        ["title": "Mandar data", "icon": "1"]
    ]
    
    
    //MARK: 1.3 Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        loadViews()
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: 1.5 UI Functions
    func loadViews(){
        //Table View
        let nib = UINib(nibName: "MainTableViewCell", bundle: nil)
        navegationTableView.register(nib, forCellReuseIdentifier: "MainTableViewCell")
        navegationTableView.dataSource = self   //Indica los elementos que tendrá la tabla
        navegationTableView.delegate = self  //Indica las acciones de cada celda
    }
    
    
    //MARK: 1.6 Segue handlers
    //A. Función que manda datos desde un ViewController a otro ViewController mediante el segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSendDataFromMain"{          //Se identifica el segue
            if let destination = segue.destination as? SendDataViewController{
                destination.paramTitle = cellsArray[0]["title"]    //Se manda la información
            }
        }
    }
}


//MARK: - 2 Extension: DataSource
extension MainViewController: UITableViewDataSource{
    //A. Función que establece cuantas celdas tendrá la tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsArray.count
    }
    
    //B. Función que establece cual es el contenido de cada una de las celdas
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = navegationTableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        cell.titleLabel.text = cellsArray[indexPath.row]["title"]!
        cell.iconImage.image = UIImage(named: cellsArray[indexPath.row]["icon"]!)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}


//MARK: - 3 Extension: Delegate
extension MainViewController: UITableViewDelegate{
    //A. Función que establece la acción que ocurrirá al hacer clic en una celda
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)    //Se des-selecciona la celda
        
        //Se hacen las distintas conexiones dependiendo del elemento de la tabla
        switch indexPath.row{
        case 0:
            performSegue(withIdentifier: "goToSendDataFromMain", sender: self)
        case 1:
            performSegue(withIdentifier: "goToTestingFromMain", sender: self)
        case 2:
            performSegue(withIdentifier: "goToCarouselFromMain", sender: self)
//        case 3:
//            performSegue(withIdentifier: "goToCamaraFromMain", sender: self)
        default:
            print("hola")
        }
    }
}
