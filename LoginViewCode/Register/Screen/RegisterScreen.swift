//
//  RegisterScreen.swift
//  LoginViewCode
//
//  Created by Senhordim on 05/12/23.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject {
    func actionBackButton()
    func actionRegisterButton()
}

class RegisterScreen: UIView {
    
    private weak var delegate: RegisterScreenProtocol?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setSubview()
        setupConstraints()
    }
    
    private func setLayout(){
        self.backgroundColor = .white
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
        self.passwordConfirmationTextField.delegate = delegate
    }
    
    private func setSubview(){
//        self.addSubview(backButton)
        self.addSubview(registerLabel)
        self.addSubview(imageRegister)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(passwordConfirmationTextField)
        self.addSubview(registerButton)
    }
    
    func delegate(delegate: RegisterScreenProtocol?){
        self.delegate = delegate
    }
    
    func validateTextfields(){
        let email: String = self.emailTextField.text ?? ""
        let password: String = self.passwordTextField.text ?? ""
        let passwordConfirmation = self.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty && !passwordConfirmation.isEmpty {
            self.buttonEnable(true)
        } else {
            self.buttonEnable(false)
        }
    }
    
    private func buttonEnable(_ enable: Bool){
        if enable {
            self.registerButton.setTitleColor(.white, for: .normal)
            self.registerButton.isEnabled = true
        } else {
            self.registerButton.setTitleColor(.white, for: .normal)
            self.registerButton.backgroundColor = .lightGray
            self.registerButton.isEnabled = false
            
            self.emailTextField.layer.borderColor = UIColor.red.cgColor
            
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Components
    lazy var backButton: UIButton = {
        let backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(named:"back"), for: .normal)
        
        return backButton
    }()
    
    lazy var registerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Registrar"
        return label
    }()
    
    lazy var imageRegister: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "3")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Insira aqui seu email"
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 4.0
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.keyboardType = .emailAddress
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Insira sua senha"
        textField.autocorrectionType = .no
        textField.isSecureTextEntry = true
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 4.0
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.keyboardType = .default
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var passwordConfirmationTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Confirme sua senha"
        textField.autocorrectionType = .no
        textField.isSecureTextEntry = true
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 4.0
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.keyboardType = .default
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var registerButton: UIButton = {
        let registerButton = UIButton()
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.setTitle("Registrar", for: .normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.clipsToBounds = true
        registerButton.layer.cornerRadius = 7.5
        registerButton.backgroundColor = UIColor(red: 77/255.0, green: 167/255.0, blue: 115/255.0, alpha: 1.0)
        registerButton.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return registerButton
    }()
    
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            // Login Label
            self.registerLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.registerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // Image Login
            self.imageRegister.topAnchor.constraint(equalTo: self.registerLabel.bottomAnchor, constant: 10),
            self.imageRegister.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.imageRegister.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.imageRegister.heightAnchor.constraint(equalToConstant: 150),
            
            // Input Email
            self.emailTextField.topAnchor.constraint(equalTo: self.imageRegister.bottomAnchor, constant: 20),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            // Input Password
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 20),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor ),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            // Input Password Confirmation
            self.passwordConfirmationTextField.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
            self.passwordConfirmationTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordConfirmationTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordConfirmationTextField.heightAnchor.constraint(equalToConstant: 50),
            
            // Register Button
            self.registerButton.topAnchor.constraint(equalTo: self.passwordConfirmationTextField.bottomAnchor, constant: 20),
            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    // função para registro
    @objc private func tappedRegisterButton(){
         self.delegate?.actionRegisterButton()
    }
    
    @objc private func tappedBackButton(){
        self.delegate?.actionBackButton()
    }
}
