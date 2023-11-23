//
//  CardView.swift
//  HikeApp
//
//  Created by 임현규 on 11/21/23.
//

import SwiftUI

struct CardView: View {
    //MARK: -- Properties
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    
    //MARK: -- Function
    
    func randomImage() {
        print("--- BUTTON WAS PRESSED ---")
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    
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
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                    .scaledToFit()
                    .animation(.default, value: imageNumber)
                }
                
                //MARK: -- Footer
                Button(action: {
                    randomImage()
                }, label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(colors: [
                                .colorGreenLight,
                                .colorGreenMedium
                            ],
                                           startPoint: .top, endPoint: .bottom)
                        )
                        .shadow(color: .black.opacity(0.25),
                                radius: 0.25, x: 1, y: 2)
                })
                .buttonStyle(GradientButtonStyle())
            } //: ZStack
        } //: CARD
        .frame(width: 320, height: 570, alignment: .center)
    }
}

#Preview {
    CardView()
}
