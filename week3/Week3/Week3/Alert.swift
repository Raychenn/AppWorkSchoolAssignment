//
//  Alert.swift
//  Week3
//
//  Created by Boray Chen on 2022/4/4.
//

import UIKit

class Alert {
    static func show(title: String?, message: String?, in viewController: UIViewController) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        viewController.present(alert, animated: true)
    }
}
