//
//  FormViewController.swift
//  Swift-1AllForOne
//
//  Created by Gabriel Toro on 14-07-22.
//

import UIKit

class FormViewController: UIViewController {
    
    // MARK: - Outlets
    // Text Field
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    
    // Label Error
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    @IBOutlet weak var phoneError: UILabel!
    
    // Submit Button
    @IBOutlet weak var submitButton: UIButton!

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        resetForm()
    }
    
    
    // MARK: - Actions
    /// Acción que se activa cada vez que se va escribiendo en el emailTextField
    @IBAction func emailChanged(_ sender: Any) {
        if let email = emailTF.text {
            if let errorMessage = invalidEmail(email) {
                emailError.text = errorMessage
                emailError.isHidden = false
            } else {
                emailError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    /// Acción que se activa cada vez que se va escribiendo en el passwordlTextField
    @IBAction func passwordChanged(_ sender: Any) {
        if let password = passwordTF.text {
            if let errorMessage = invalidPassword(password) {
                passwordError.text = errorMessage
                passwordError.isHidden = false
            } else {
                passwordError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    /// Acción que se activa cada vez que se va escribiendo en el phoneTextField
    @IBAction func phoneChanged(_ sender: Any) {
        if let phoneNumber = phoneTF.text {
            if let errorMessage = invalidPhoneNumber(phoneNumber) {
                phoneError.text = errorMessage
                phoneError.isHidden = false
            } else {
                phoneError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    /// Acción que se activa al hacer click en el botón Enviar
    @IBAction func submitAction(_ sender: Any) {
        resetForm()
    }
    
    
    // MARK: - Extra -> Functions
    /// Función que reinicia la información, tanto al momento de cargar la vista, como de al hacer clic en el botón para enviar la información
    func resetForm(){
        submitButton.isEnabled = false
        
        emailError.isHidden = false
        passwordError.isHidden = false
        phoneError.isHidden = false
        
        emailError.text = "Requerido"
        passwordError.text = "Requerido"
        phoneError.text = "Requerido"
        
        emailTF.text = ""
        passwordTF.text = ""
        phoneTF.text = ""
    }
    
    
    // MARK: - Extra -> Validaciones
    /// Función que activa el botón si todos las casillas estan completadas correctamentes
    func checkForValidForm() {
        if emailError.isHidden && passwordError.isHidden && phoneError.isHidden {
            submitButton.isEnabled = true
        } else {
            submitButton.isHidden = false
        }
    }
    
    /// Función que comprueba que se cumpla todo lo necesario para el campo de texto Email
    func invalidEmail(_ value: String) -> String? {
        
        let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        if !predicate.evaluate(with: value) {
            return "Invalid Email Address"
        }
        return nil
    }
    
    /// Función que comprueba que se cumpla todo lo necesario para el campo de texto Password
    func invalidPassword(_ value: String) -> String? {
        if value.count < 8 {
            return "La contraseña tiene que tener al menos 8 caracteres"
        }
        if containsDigit(value) {
            return "La contraseña debe tener al menos un dígito"
        }
        if containsLowerCase(value) {
            return "La contraseña debe tener al menos una minúscula"
        }
        if containsUpperCase(value) {
            return "La contraseña debe tener al menos una mayúscula"
        }
        return nil
    }
    
    /// Función que comprueba que se cumpla todo lo necesario para el campo de texto Phone
    func invalidPhoneNumber(_ value: String) -> String? {
        let set = CharacterSet(charactersIn: value)
        if !CharacterSet.decimalDigits.isSuperset(of: set) {
            return "El número de teléfono solo puede tener números"
        }
        
        if value.count != 10 {
            return "El número de teléfono no tiene 10 dígitos"
        }
        
        return nil
    }
    
    
    // MARK: - Extra -> Regular Expression
    /// Función que revisa si la expresión contiene dígitos
    func containsDigit(_ value: String) -> Bool {
        let regularExpression = ".*[0-9]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return !predicate.evaluate(with: value)
    }
    
    /// Función que revisa si la expresión contiene minúsculas
    func containsLowerCase(_ value: String) -> Bool {
        let regularExpression = ".*[a-z ]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return !predicate.evaluate(with: value)
    }
    
    /// Función que revisa si la expresión contiene mayúsculas
    func containsUpperCase(_ value: String) -> Bool {
        let regularExpression = ".*[A-Z]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return !predicate.evaluate(with: value)
    }
}
