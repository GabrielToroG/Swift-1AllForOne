//
//  ModalViewController.swift
//  Swift-1AllForOne
//
//  Created by Gabriel Toro on 08-06-22.
//

import UIKit


//MARK: 1. ModalViewController
class ModalViewController: UIViewController {
        
    
    //MARK: - Variables
    private let myKey = "MY_KEY"
    
    //A. Ventana emergente
    lazy var popUpWindow: PopUpWindow = {
        let view = PopUpWindow()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.delegate = self        //No olvidar: Para que funcione el delegate, en donde se creara la funcion de cierre
        return view
    }()
    
    //B. Animación Blur
    let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //C. Botón que activa la ventana emergente
    lazy var buttonPop: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("Abrir Modal", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(handleShowPopUp), for: .touchUpInside) //Une un elemento(botón) con una acción
        button.translatesAutoresizingMaskIntoConstraints = false    //IMPORTANTE: Si no haces esto, no funciona el addSubview
        button.layer.cornerRadius = 5
        return button
    }()
    
    //D. Boton de User Default
    lazy var buttonUserDefault: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("Abrir User Default", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(showUserDefault), for: .touchUpInside) //Une un elemento(botón) con una acción
        button.translatesAutoresizingMaskIntoConstraints = false    //IMPORTANTE: Si no haces esto, no funciona el addSubview
        button.layer.cornerRadius = 5
        return button
    }()
    

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViews()
    }
    
    
    //MARK: - UI Functions
    func loadViews(){
        view.backgroundColor = UIColor.lightGray
        
        //Boton
        view.addSubview(buttonPop)             //Se añade el botón a la vista
        buttonPop.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonPop.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        buttonPop.widthAnchor.constraint(equalToConstant: view.frame.width - 64).isActive = true
        buttonPop.heightAnchor.constraint(equalToConstant: 50).isActive = true                     //Altua definida

        //Boton
        view.addSubview(buttonUserDefault)             //Se añade el botón a la vista
        buttonUserDefault.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonUserDefault.topAnchor.constraint(equalTo: buttonPop.bottomAnchor, constant: 32).isActive = true
        buttonUserDefault.widthAnchor.constraint(equalToConstant: view.frame.width - 64).isActive = true
        buttonUserDefault.heightAnchor.constraint(equalToConstant: 50).isActive = true                     //Altua definida
        
        //Efecto Blur
        view.addSubview(visualEffectView)   //Se añade el efecto a la vista
        visualEffectView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true        //Todo el espacio de la izquierda
        visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true    //Todo el espacio de abajo
        visualEffectView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true      //Todo el espacio de la derecha
        visualEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true          //Todo el espacio de arriba
        visualEffectView.alpha = 0  //Con esto se esconde el efecto
    }
    
    
    //MARK: - Actions
    @objc func handleShowPopUp() {
        view.addSubview(popUpWindow)    //Se añade a la vista
        popUpWindow.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true                   //Centrado en X
        popUpWindow.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40).isActive = true    //Se mueve 40 arriba del centrado en Y
        popUpWindow.heightAnchor.constraint(equalToConstant: 205).isActive = true         //Altua definida
        popUpWindow.widthAnchor.constraint(equalToConstant: 280).isActive = true          //Ancho definido view.frame.width - 64
        popUpWindow.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        popUpWindow.alpha = 0
        
        UIView.animate(withDuration: 0.5) {
            self.visualEffectView.alpha = 1
            self.popUpWindow.alpha = 1
            self.popUpWindow.transform = CGAffineTransform.identity
        }
    }
    
    @objc func showUserDefault() {
        if let value = UserDefaults.standard.string(forKey: myKey) {
//            metricHelper()
        } else {
            //flujo normal
        }
    }
}


//MARK: 2 Extension: PopUpDelegate
extension ModalViewController: PopUpDelegate {
    //COMO PUEDO SABER QUE ELEMENTO EJECUTA TAL ACCION????
    
    func handleDismissImperial() {
        UIView.animate(withDuration: 0.5, animations: {
            self.visualEffectView.alpha = 0
            self.popUpWindow.alpha = 0
            self.popUpWindow.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }) { (_) in
            self.popUpWindow.removeFromSuperview()
            print("Se removió la ventana")
            UserDefaults.standard.set("Imperial", forKey: self.myKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    func handleDismissMetric() {
        UIView.animate(withDuration: 0.5, animations: {
            self.visualEffectView.alpha = 0
            self.popUpWindow.alpha = 0
            self.popUpWindow.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }) { (_) in
            self.popUpWindow.removeFromSuperview()
            UserDefaults.standard.set("Metric", forKey: self.myKey)
            UserDefaults.standard.synchronize()
        }
    }
}
