//
//  OnboardingView.swift
//  BucketList
//
//  Created by Alex Sapsford on 10/09/2020.
//  Copyright © 2020 Alex Sapsford. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    
  //  @ObservedObject private var viewModel: OnboardingViewModel
    @State private var isUnlocked = false
    
    var body: some View {
        Text("Welcome to the worst welcoming page")
            
            // need to navigate to the bucket list tab view once click the button which will do the action of authenticating via biometrics
        }
    }

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
