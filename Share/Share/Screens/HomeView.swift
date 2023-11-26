//
//  HomeView.swift
//  Share
//
//  Created by 임현규 on 11/25/23.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack(spacing: 20, content: {
                // MARK: -- Header
                
                Spacer()
                
                ZStack {
                    CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                    
                    Image(.character2)
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .offset(y: isAnimating ? 35 :  -35)
                        .animation(.easeInOut(duration: 4).repeatForever(), value: isAnimating)
                }
                
                
                // MARK: -- Center
                
                Text("The time that leads to mastery is dependent on the intensity of our focus.")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                
                // MARK: -- Footer
                
                Spacer()
                
                Button(action: {
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }, label: {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                    Text("Restart")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                })//: Button
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
            }) //: VSTACK
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    isAnimating = true
                })
            })
        }
    }
}

#Preview {
    HomeView()
}
