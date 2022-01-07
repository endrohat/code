//
//  StringExtension.swift
//  code
//
//  Created by indraneel potnis on 07/01/22.
//

import Foundation


extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}
