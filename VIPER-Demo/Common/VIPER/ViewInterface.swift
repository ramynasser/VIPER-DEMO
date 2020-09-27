//
//  ViewInterface.swift
//  VIPER-Demo
//
//  Created by Ramy Nasser on 9/27/20.
//  Copyright © 2020 Ramy Nasser. All rights reserved.
//

import UIKit
import SVProgressHUD

protocol ViewInterface: class {
    func showProgressHUD()
    func hideProgressHUD()
}

extension ViewInterface {

    func showProgressHUD() {
        SVProgressHUD.show()
    }

    func hideProgressHUD() {
        SVProgressHUD.dismiss()
    }
}
