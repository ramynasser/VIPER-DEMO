//
//  PasswordValidator.swift
//  VIPER-Demo
//
//  Created by Ramy Nasser on 9/27/20.
//  Copyright © 2020 Ramy Nasser. All rights reserved.
//

import Foundation
class PasswordValidator: StringValidator {

    private let _minLength: UInt

    init(minLength: UInt) {
        _minLength = minLength
    }

    func isValid(_ value: String) -> Bool {
        if let length = UInt(exactly: value.count) {
            return (length >= _minLength)
        }
        return false
    }

}
