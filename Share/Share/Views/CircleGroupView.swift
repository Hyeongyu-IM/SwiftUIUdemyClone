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
    
    var body: some View {
        ZStack(content: {
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }) // ZStack
    }
}

#Preview {
    ZStack(content: {
        Color(.colorBlue)
            .ignoresSafeArea()
        CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
    })
}
