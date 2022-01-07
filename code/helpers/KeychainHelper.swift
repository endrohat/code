//
//  KeychainHelper.swift
//  code
//
//  Created by indraneel potnis on 06/01/22.
//

import Foundation
import KeychainSwift

class KeychainHelper {
    
    let keychain = KeychainSwift()
    
    func saveCode(code : String) {

        if TextHelper.checkValidCode(code: code) == false {
            return
        }
        
        keychain.set(code, forKey: "code")
    }
    
    func retrieveCode() -> String? {
        return keychain.get("code")
    }
}
