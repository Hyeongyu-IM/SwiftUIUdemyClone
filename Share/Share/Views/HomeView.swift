//
//  HomeView.swift
//  Share
//
//  Created by 임현규 on 11/25/23.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
    var body: some View {
        VStack(content: {
            Text("Home")
                .font(.largeTitle)
            
            Button(action: {
                
            }, label: {
                Text("Restart")
            })
        }) //: VSTACK
    }
}

#Preview {
    HomeView()
}
