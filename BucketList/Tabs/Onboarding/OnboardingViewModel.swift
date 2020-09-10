//
//  OnboardingViewModel.swift
//  BucketList
//
//  Created by Alex Sapsford on 10/09/2020.
//  Copyright © 2020 Alex Sapsford. All rights reserved.
//

import Foundation
import Combine
import LocalAuthentication

class OnboardingViewModel: ObservableObject {
    
    
@Published var isUnlocked = false
    
    
func authenticate() {
           let context = LAContext()
           var error: NSError?
           
           if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
               let reason = "Please authentiucate yourself to unlock your places."
               context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                   DispatchQueue.main.async {
                       if success {
                           self.isUnlocked = true
                       } else {
                           print("Sorry there has been a problem authenticating. Please try again.")
                       }
                   }
                   
               }
           } else {
               print("No biometrics")
           }
       }
    
    
}
