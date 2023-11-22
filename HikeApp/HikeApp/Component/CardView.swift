//
//  CardView.swift
//  HikeApp
//
//  Created by 임현규 on 11/21/23.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                //MARK: -- Header
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [.colorGrayLight,
                                                        .colorGrayMedium],
                                               startPoint: .top, endPoint: .bottom)
                        )
                        
                        Spacer()
                        
                        Button {
                            //Action: Show a Sheet
                            
                        } label: {
                            CustomButtonView()
                        }
                    }
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundStyle(.colorGrayMedium)
                } //Header
                .padding(.horizontal, 30)
                
                //MARK: -- Main Content
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(colors: [.colorIndigoMedium, .colorSalmonLight],
                                           startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .frame(width: 256, height: 256, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Image("image-1")
                        .resizable()
                    .scaledToFit()
                }
            }
        } //: CARD
        .frame(width: 320, height: 570, alignment: .center)
    }
}

#Preview {
    CardView()
}
