//
//  GradientButtonStyle.swift
//  HikeApp
//
//  Created by 임현규 on 11/23/23.
//

import Foundation
import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                configuration.isPressed ?
                LinearGradient(colors: [.colorGrayMedium, .colorGrayLight],
                               startPoint: .top, endPoint: .bottom)
                
                : LinearGradient(colors: [
                    .colorGrayLight,
                    .colorGrayMedium],
                                 startPoint: .top, endPoint: .bottom)
            )
            .clipShape(RoundedRectangle(cornerRadius: 40))
    }
}
