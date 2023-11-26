//
//  CircleGroupView.swift
//  Share
//
//  Created by 임현규 on 11/26/23.
//

import SwiftUI

struct CircleGroupView: View {
    //MARK: -- Properties
    
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack(content: {
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }) // ZStack
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

#Preview {
    ZStack(content: {
        Color(.colorBlue)
            .ignoresSafeArea()
        CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
    })
}
