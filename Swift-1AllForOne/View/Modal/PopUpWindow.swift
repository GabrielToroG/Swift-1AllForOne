//
//  PopUpWindow.swift
//  Swift-1AllForOne
//
//  Created by Gabriel Toro on 08-06-22.
//

import UIKit

//MARK: Protocol
//Protocolo que permite delegar el código, es decir, se programará en otro archivo (ModalViewController), no en este.
protocol PopUpDelegate {
    func handleDismissImperial()
    func handleDismissMetric()
}


//MARK: PopUpWindow
class PopUpWindow: UIView {
    
    
    //MARK: - Variables
    var delegate: PopUpDelegate?
    
    //A. Checkbox Label
    let titlePopUp: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.text = "Sistema de unidades"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    //B. Notification Label
    let descriptionPopUp: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Selecciona tu sistema de unidades preferido"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    //C. First Separator
    let firstSeparator:UIView = {
       let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .systemPurple
        return separator
    }()
    
    //D. Imperial Button
    lazy var imperialButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Imperial (EE.UU.)", for: .normal)
        button.setTitleColor(UIColor.link, for: .normal)
        button.addTarget(self, action: #selector(handleDismissImperial), for: .touchUpInside) //Une un elemento(botón) con una acción
        button.translatesAutoresizingMaskIntoConstraints = false    //IMPORTANTE: Si no haces esto, no funciona el addSubview
        button.layer.cornerRadius = 5
        return button
    }()
    
    //E. Second Separator
    let secondSeparator:UIView = {
       let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .systemPurple
        return separator
    }()
    
    //F. Metric Button
    lazy var metricButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Métrico", for: .normal)
        button.setTitleColor(UIColor.link, for: .normal)
        button.addTarget(self, action: #selector(handleDismissMetric), for: .touchUpInside) //Une un elemento(botón) con una acción
        button.translatesAutoresizingMaskIntoConstraints = false    //IMPORTANTE: Si no haces esto, no funciona el addSubview
        button.layer.cornerRadius = 5
        return button
    }()
    
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(titlePopUp)
        titlePopUp.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        titlePopUp.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        titlePopUp.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titlePopUp.topAnchor.constraint(equalTo: topAnchor, constant: 24).isActive = true
        
        
        addSubview(descriptionPopUp)
        descriptionPopUp.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        descriptionPopUp.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        descriptionPopUp.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        descriptionPopUp.topAnchor.constraint(equalTo: titlePopUp.bottomAnchor, constant: 8).isActive = true
        
        
        addSubview(firstSeparator)
        firstSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        firstSeparator.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        firstSeparator.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        firstSeparator.topAnchor.constraint(equalTo: descriptionPopUp.bottomAnchor, constant: 16).isActive = true
        
        
        addSubview(imperialButton)
        imperialButton.heightAnchor.constraint(equalToConstant: 16).isActive = true
        imperialButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        imperialButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        imperialButton.topAnchor.constraint(equalTo: firstSeparator.bottomAnchor, constant: 14).isActive = true
        
        
        addSubview(secondSeparator)
        secondSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        secondSeparator.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        secondSeparator.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        secondSeparator.topAnchor.constraint(equalTo: imperialButton.bottomAnchor, constant: 14).isActive = true
        
        
        addSubview(metricButton)
        metricButton.heightAnchor.constraint(equalToConstant: 16).isActive = true
        metricButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        metricButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        metricButton.topAnchor.constraint(equalTo: secondSeparator.bottomAnchor, constant: 14).isActive = true

    }
    
    required init?(coder: NSCoder) {    //Codigo necesario para que funcione el init anterior
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Actions
    @objc func handleDismissImperial() {
        delegate?.handleDismissImperial()
    }
    
    @objc func handleDismissMetric() {
        delegate?.handleDismissMetric()
    }
}
