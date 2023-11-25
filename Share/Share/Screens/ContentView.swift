//
//  ContentView.swift
//  Share
//
//  Created by 임현규 on 11/25/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        ZStack(content: {
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        })
    }
}

#Preview {
    ContentView()
}
