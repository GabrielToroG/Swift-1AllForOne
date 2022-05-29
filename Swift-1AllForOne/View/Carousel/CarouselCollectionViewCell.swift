//
//  CarouselCollectionViewCell.swift
//  Swift-1AllForOne
//
//  Created by Gabriel Toro on 27-05-22.
//

import UIKit

//MARK: 1 CarouselCollectionViewCell
class CarouselCollectionViewCell: UICollectionViewCell {
    
    
    //MARK: 1.1 Outlets
    @IBOutlet weak var slideImage: UIImageView!
    @IBOutlet weak var slideTitle: UILabel!
    @IBOutlet weak var slideDescription: UILabel!
    @IBOutlet weak var buttonContainer: UIView!
    @IBOutlet weak var slideButton: UIButton!
    @IBOutlet weak var slideControl: UIPageControl!
    
    //Constraint
    @IBOutlet weak var topImageConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightImageConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightTitleConstraint: NSLayoutConstraint!
    @IBOutlet weak var topStackConstraint: NSLayoutConstraint!
    
    
    //MARK: 1.2 Variables
    let screenSize: CGRect = UIScreen.main.bounds
    
    
    //MARK: 1.3 Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        loadViews()
    }
   
    
    //MARK: 1.5 UI Functions
    //A. Función que carga las vistas
    func loadViews(){
        if screenSize.height <= 700{
            heightImageConstraint.constant = 340
            topImageConstraint.constant = 24
            topStackConstraint.constant = 16
        }
        
        buttonContainer.isHidden = true
        slideButton.layer.cornerRadius = 30
        slideButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        slideButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        slideButton.layer.shadowOpacity = 1
        slideButton.layer.shadowRadius = 4
    }
}
