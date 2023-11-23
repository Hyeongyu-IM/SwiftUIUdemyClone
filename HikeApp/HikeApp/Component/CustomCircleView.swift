//
//  CustomCircleView.swift
//  HikeApp
//
//  Created by 임현규 on 11/23/23.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimateGradient: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(colors: [.colorIndigoMedium, .colorSalmonLight],
                                   startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
                                   endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing)
                )
                .onAppear(perform: {
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                        isAnimateGradient.toggle()
                    }
                })
            .frame(width: 256, height: 256, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            MotionAnimationView()
        } //: ZStack
    }
}

#Preview {
    CustomCircleView()
}
