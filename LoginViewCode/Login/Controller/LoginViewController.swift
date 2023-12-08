//
//  ViewController.swift
//  LoginViewCode
//
//  Created by Senhordim on 04/12/23.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    var loginScreen: LoginScreen?
    
    var auth: Auth?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
        self.auth = Auth.auth()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.configTextFieldDelegate(delegate: self)
        self.loginScreen?.delegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}


extension LoginViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


extension LoginViewController: LoginScreenProtocol{
    func actionLoginButton() {
       
        guard let register = self.loginScreen else { return }
        
        self.auth?.signIn(withEmail: register.getEmail(), password: register.getPassword(), completion: { (usuario, error) in
            if error != nil{
                print("erro ao logar")
            } else {
                if usuario == nil {
                    print("Tivemos um problema inesperado, tente novamente mais tarde")
                } else {
                    print("Usuário logado com sucesso")
                }
            }
        })
        
    }
    
    func actionRegisterButton() {
        let registerViewController: RegisterViewController = RegisterViewController()
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    
}

