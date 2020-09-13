//
//  OnboardingView.swift
//  BucketList
//
//  Created by Alex Sapsford on 10/09/2020.
//  Copyright © 2020 Alex Sapsford. All rights reserved.
//

import SwiftUI
import LocalAuthentication

struct OnboardingView: View {
    
    private let authenticationController: AuthenticationController
    
    @State var error: Error?
    
    // MARK: Init
    
    init(authenticationController: AuthenticationController) {
        self.authenticationController = authenticationController
    }
    
    // MARK: View
    
    var body: some View {
        NavigationView{
            VStack{
                Button("Get Started") {
                    self.authenticationController.authenticate(result: { (result) in
                        if case .failure(let error) = result {
                            self.error = error
                        }
                    })
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .clipShape(Capsule())
            }
            .navigationBarTitle("Welcome")
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(authenticationController: AuthenticationController())
    }
}
