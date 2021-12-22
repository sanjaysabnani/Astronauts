//
//  Extensions.swift
//  Astronauts
//
//  Created by M_Sanjay on 22/12/2021.
//

import UIKit

extension UIViewController {
    
    func showAlert (title: String?, message: String?) {
        if self.presentedViewController is UIAlertController {
            return
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: Constants.Strings.ok, style: .default, handler: .none)
            alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
