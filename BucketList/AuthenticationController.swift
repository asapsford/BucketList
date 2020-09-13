//
//  AuthenticationController.swift
//  BucketList
//
//  Created by Alex Sapsford on 13/09/2020.
//  Copyright © 2020 Alex Sapsford. All rights reserved.
//

import Foundation
import LocalAuthentication

class AuthenticationController {
    
    @Published private(set) var isAuthenticated: Bool = false
    
    func authenticate(result: ((Swift.Result<Bool, Error>) -> Void)?) {
        let context = LAContext()
        var error: NSError?
        
        let hasBiometrics = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        if hasBiometrics {
            let reason = "Please authenticate yourself to unlock your places."
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    self.isAuthenticated = success
                    if success {
                        result?(.success(true))
                    } else {
                        result?(.failure(AuthenticationError.unknown))
                    }
                }
            }
        } else {
            result?(.failure(AuthenticationError.biometricsUnavailable))
        }
    }
}

enum AuthenticationError: Error {
    case biometricsUnavailable
    case unknown
}
