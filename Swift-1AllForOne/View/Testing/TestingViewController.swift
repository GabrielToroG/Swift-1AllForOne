//
//  TestingViewController.swift
//  Swift-1AllForOne
//
//  Created by Gabriel Toro on 27-05-22.
//

import UIKit

class TestingViewController: UIViewController {

    
    @IBOutlet weak var testingTableView: UITableView!
    
    var cellsArray = [
        ["title": "Mandar data", "icon": "ic_main_send_data"],
        ["title": "Carrusel", "icon": "ic_main_carousel"],
//        ["title": "Mandar data", "icon": "1"],
//        ["title": "Mandar data", "icon": "1"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViews()
        // Do any additional setup after loading the view.
    }
    
    
    
    func loadViews(){
        //Table View
//        let nib = UINib(nibName: "MainTableViewCell", bundle: nil)
//        navegationTableView.register(nib, forCellReuseIdentifier: "MainTableViewCell")
        testingTableView.dataSource = self   //Indica los elementos que tendrá la tabla
//        navegationTableView.delegate = self  //Indica las acciones de cada celda
        testingTableView.rowHeight = 44 //Colocarlo manualmente en el Cell, solo para la visual
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


//MARK: - 2 Extension: DataSource
extension TestingViewController: UITableViewDataSource{
    //A. Función que establece cuantas celdas tendrá la tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsArray.count
    }
    
    //B. Función que establece cual es el contenido de cada una de las celdas
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = testingTableView.dequeueReusableCell(withIdentifier: "TestingTableViewCell", for: indexPath) as! TestingTableViewCell
        cell.labelCell.text = cellsArray[indexPath.row]["title"]!
        cell.imageCell.image = UIImage(named: cellsArray[indexPath.row]["icon"]!)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
