//
//  OnboardingView.swift
//  Share
//
//  Created by 임현규 on 11/25/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
    var body: some View {
        ZStack(content: {
            Color(.colorBlue)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                //MARK: -- Header
                Spacer()
                VStack(content: {
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                    
                    Text("""
It's not how much we give but how much love we put into giving.
""")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                }) //: Header
                //MARK: -- Center
                
                ZStack(content: {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    
                    Image(.character1)
                        .resizable()
                        .scaledToFit()
                }) //: Center
                
                Spacer()
                
                //MARK: -- Footer
                
                ZStack(content: {
                    
                    Capsule()
                        .fill(.white.opacity(0.2))
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    
                    Text("Get Started")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .offset(x: 20)
                    
                    HStack(content: {
                        Capsule()
                            .fill(.colorRed)
                            .frame(width: 80)
                        
                        Spacer()
                    })
                    
                    HStack {
                        ZStack(content: {
                            Circle()
                                .fill(Color.colorRed)
                            Circle()
                                .fill(Color.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                            Spacer()
                        })
                        .foregroundStyle(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .onTapGesture {
                            isOnboardingViewActive = false
                        }
                        
                        Spacer()
                    }//: HStack
                    
                }) //: ZStack
                .frame(height: 80, alignment: .center)
                .padding()
            } //: VStack
            
        })
    }
}

#Preview {
    OnboardingView()
}
