//
//  EmailValidator.swift
//  VIPER-Demo
//
//  Created by Ramy Nasser on 9/27/20.
//  Copyright © 2020 Ramy Nasser. All rights reserved.
//

import Foundation
import UIKit

class EmailValidator: StringValidator {

    func isValid(_ value: String) -> Bool {
        return (value.count > 3 && value.contains("@"))
    }

}
