//
//  HomeViewController.swift
//  LoginViewCode
//
//  Created by Senhordim on 09/12/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeScreen: HomeScreen?
    
    var data: [DataUser] = [
        DataUser(name: "Caio Modovosk", nameImage: "Menino1"),
        DataUser(name: "Elisangela Souza", nameImage: "menina1")
    ]
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = self.homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserDetailViewCell? = tableView.dequeueReusableCell(withIdentifier: UserDetailViewCell.identifier, for: indexPath) as? UserDetailViewCell
        cell?.setUpCell(data: self.data[indexPath.row])
        return cell ?? UserDetailViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}
