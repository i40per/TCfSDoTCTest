//
//  UIViewController + Extension.swift
//  TCfSDoTCTest
//
//  Created by Евгений Лукин on 22.06.2023.
//

import Foundation
import UIKit

extension UIViewController {
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
