//
//  CarouselViewController.swift
//  Swift-1AllForOne
//
//  Created by Gabriel Toro on 27-05-22.
//

import UIKit

//MARK: - 1 CarouselViewController
class CarouselViewController: UIViewController {
    
    
    //MARK: 1.1 Outlets
    @IBOutlet weak var carouselCollectionView: UICollectionView!
    
    
    //MARK: 1.2 Variables
    var slideOnBoarding = [
        [
            "image":        "carousel_1",
            "title":        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vestibulum.",
            "description":  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sed leo purus. Cras nec sem at arcu.",
        ],
        [
            "image":        "carousel_1",
            "title":        "",
            "description":  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sed leo purus. Cras nec sem at arcu.",
        ],
        [
            "image":        "carousel_1",
            "title":        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vestibulum.",
            "description":  "",
        ]
    ]

    
    //MARK: 1.3 Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViews()
    }
    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//
//        let gradient = CAGradientLayer()
//        gradient.colors =  [UIColor.systemBlue.cgColor, UIColor.systemGreen.cgColor]
//        gradient.locations = [0.0, 1.0]
//        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
//        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
//        gradient.frame = CGRect(x: 0.0, y: 0.0, width: carouselCollectionView.frame.size.width , height: carouselCollectionView.frame.size.height)
//        carouselCollectionView.layer.insertSublayer(gradient, at: 0)
//        self.view.layer.insertSublayer(gradient, at: 0)
//    }

    //MARK: 1.5 UI Functions
    //A. Función que carga las vistas
    func loadViews(){
        carouselCollectionView.dataSource = self    //Indicates the elements that the table will have
        carouselCollectionView.delegate = self      //Indicates the actions of each cell
    }
}


//MARK: - 2 Extension: DataSource
extension CarouselViewController: UICollectionViewDataSource{
    //A. Función que establece cuantas secciones tendrá la colección
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    //B. Función que establece cuantas celdas habrá por sección
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    //C. Función que establece cual es el contenido de cada una de las celdas
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCollectionViewCell", for: indexPath) as? CarouselCollectionViewCell
        
        cell!.slideImage.image = UIImage(named: slideOnBoarding[indexPath.section]["image"]! )
        cell!.slideTitle.text = (slideOnBoarding[indexPath.section]["title"])
        cell!.slideDescription.text = (slideOnBoarding[indexPath.section]["description"])
        cell!.slideControl.numberOfPages = slideOnBoarding.count
        cell!.slideControl.currentPage = indexPath.section
        cell?.slideControl.isUserInteractionEnabled = false
        
        if indexPath.section == 1 {
            cell!.heightTitleConstraint.constant = 60
        }
        
        if indexPath.section == 2 {
            cell!.buttonContainer.isHidden = false
            cell!.slideDescription.isHidden = true
        }

        return cell!
    }
}


//MARK: - 3 Extension: Delegate
extension CarouselViewController: UICollectionViewDelegate{
    //A. Función que establece la acción que ocurrirá al hacer clic en una celda
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("!")
    }
}


//MARK: - 4 Extension: DelegateFlowLayout
extension CarouselViewController: UICollectionViewDelegateFlowLayout{
    //A. Función que establece que la celda tome toda la pantalla
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: carouselCollectionView.bounds.width, height: carouselCollectionView.bounds.height)
    }
}
