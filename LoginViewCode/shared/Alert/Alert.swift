//
//  Alert.swift
//  LoginViewCode
//
//  Created by Senhordim on 08/12/23.
//

import Foundation
import UIKit

class Alert: NSObject {
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func getAlert(title: String, description: String, completion: (() -> Void)? = nil){
        let alertController = UIAlertController(title: title, message: description, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Ok", style: .cancel) { action in
            completion?()
        }
        alertController.addAction(cancel)
        self.controller.present(alertController, animated: true)
    }
}
