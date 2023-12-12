//
//  HomeScreen.swift
//  LoginViewCode
//
//  Created by Senhordim on 09/12/23.
//

import UIKit

class HomeScreen: UIView {

    
    private func setLayout(){
        self.backgroundColor = .red
    }
    
    private func addSubview(){
        self.addSubview(tableView)
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.register(UserDetailViewCell.self, forCellReuseIdentifier: UserDetailViewCell.identifier)
        return tableView
    }()
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo:  self.safeAreaLayoutGuide.topAnchor),
            self.tableView.rightAnchor.constraint(equalTo:  self.safeAreaLayoutGuide.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo:  self.safeAreaLayoutGuide.bottomAnchor),
            self.tableView.leftAnchor.constraint(equalTo:  self.safeAreaLayoutGuide.leftAnchor),
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
        addSubview()
        setupConstraints()
    }
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
