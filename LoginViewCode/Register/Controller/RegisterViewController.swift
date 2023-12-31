//
//  RegisterViewController.swift
//  LoginViewCode
//
//  Created by Senhordim on 05/12/23.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    var registerScreen: RegisterScreen?
    
    var auth: Auth?
    
    var alert: Alert?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
        self.alert = Alert(controller: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        self.registerScreen?.delegate(delegate: self)
        self.auth = Auth.auth()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    

}

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.registerScreen?.validateTextfields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension RegisterViewController: RegisterScreenProtocol {
    func actionBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
        
        guard let register = self.registerScreen else { return }
                
        self.auth?.createUser(withEmail: register.getEmail(), password: register.getPassword(), completion: { (result, error) in
            if error != nil{
                self.alert?.getAlert(title: "Erro!", description: "erro ao cadastrar")
            } else {
//                self.alert?.getAlert(title: "Parabéns!", description: "Usuário cadastrado com sucesso", completion: {
//                    self.navigationController?.popViewController(animated: true)
//                })
                let homeViewController: HomeViewController = HomeViewController()
                self.navigationController?.pushViewController(homeViewController, animated: true)
            }
        })
    }
    
    
}
