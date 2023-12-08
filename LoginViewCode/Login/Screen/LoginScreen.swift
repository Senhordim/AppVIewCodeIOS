//
//  LoginScreen.swift
//  LoginViewCode
//
//  Created by Senhordim on 04/12/23.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func actionLoginButton()
    func actionRegisterButton()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
        self.setSubview()
        self.loginLabelConstraints()
        self.imageLoginConstraints()
        self.emailTextFieldConstraints()
        self.passwordTextFieldConstraints()
        self.loginButtonConstraints()
        self.registerButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout(){
        self.backgroundColor = .white
    }
    
    
    private func setSubview(){
        self.addSubview(self.loginLabel)
        self.addSubview(self.imageLogin)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.loginButton)
        self.addSubview(self.registerButton)
    }
    
    func delegate(delegate: LoginScreenProtocol?){
        self.delegate = delegate
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    // Components
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Login"
        return label
    }()
    
    lazy var imageLogin: UIImageView = {
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
        textField.placeholder = "Insira aqui sua senha"
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 4.0
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Entrar", for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.clipsToBounds = true
        loginButton.layer.cornerRadius = 7.5
        loginButton.backgroundColor = UIColor(red: 77/255.0, green: 167/255.0, blue: 115/255.0, alpha: 1.0)
        loginButton.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        return loginButton
    }()
    
    lazy var registerButton: UIButton = {
        let registerButton = UIButton()
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.setTitle("Ainda não tem conta? cadastre-se.", for: .normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        registerButton.setTitleColor(.gray, for: .normal)
        registerButton.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return registerButton
    }()
    
    // função para login
    @objc private func tappedLoginButton(){
        self.delegate?.actionLoginButton()
    }
    
    // função para registro
    @objc private func tappedRegisterButton(){
        self.delegate?.actionRegisterButton()
        
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
        
        ])
    }
    
    private func loginLabelConstraints(){
        // self.loginLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
        // self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        self.loginLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    private func imageLoginConstraints(){
        // self.imageLogin.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 10),
        // self.imageLogin.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
        // self.imageLogin.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        // self.imageLogin.heightAnchor.constraint(equalToConstant: 150),
        self.imageLogin.snp.makeConstraints { make in
            make.top.equalTo(self.self.loginLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.width.equalTo(150)
        }
    }
    
    private func emailTextFieldConstraints(){
        // self.emailTextField.topAnchor.constraint(equalTo: self.imageLogin.bottomAnchor, constant: 10),
        // self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
        // self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
        // self.emailTextField.heightAnchor.constraint(equalToConstant: 50),
        self.emailTextField.snp.makeConstraints { make in
            make.top.equalTo(self.self.imageLogin.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().inset(40)
            make.height.equalTo(50)
        }
    }
    
    private func passwordTextFieldConstraints(){
        // self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 20),
        // self.passwordTextField.leadingAnchor.constraint(equalTo:  self.emailTextField.leadingAnchor),
        // self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
        // self.passwordTextField.heightAnchor.constraint(equalToConstant: 50),
        self.passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(20)
            make.leading.equalTo(self.emailTextField.snp.leading)
            make.trailing.equalTo(self.emailTextField.snp.trailing)
            make.height.equalTo(self.emailTextField.snp.height)
        }
    }
    
    private func loginButtonConstraints(){
        self.loginButton.snp.makeConstraints { make in
            // self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
            // self.loginButton.leadingAnchor.constraint(equalTo:  self.emailTextField.leadingAnchor),
            // self.loginButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            // self.loginButton.heightAnchor.constraint(equalToConstant: 50),
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(20)
            make.leading.equalTo(self.emailTextField.snp.leading)
            make.trailing.equalTo(self.emailTextField.snp.trailing)
            make.height.equalTo(self.emailTextField.snp.height)
        }
    }
    
    private func registerButtonConstraints(){
        self.registerButton.snp.makeConstraints { make in
            // self.registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 40),
            // self.registerButton.leadingAnchor.constraint(equalTo:  self.emailTextField.leadingAnchor),
            // self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            // self.registerButton.heightAnchor.constraint(equalToConstant: 25),
            make.top.equalTo(self.loginButton.snp.bottom).offset(30)
            make.leading.equalTo(self.emailTextField.snp.leading)
            make.trailing.equalTo(self.emailTextField.snp.trailing)
            make.height.equalTo(self.emailTextField.snp.height)
            
        }
    }
    
}
