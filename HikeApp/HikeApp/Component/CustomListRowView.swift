//
//  CustomListRowView.swift
//  HikeApp
//
//  Created by 임현규 on 11/24/23.
//

import SwiftUI

struct CustomListRowView: View {
    //MARK: -- Properties
    
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowlinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        LabeledContent {
            if let rowContent {
                Text(rowContent)
                    .foregroundStyle(.primary)
                    .fontWeight(.heavy)
            }
            if let rowlinkLabel,
               let rowLinkDestination {
                Link(rowlinkLabel, destination: URL(string: rowLinkDestination)!)
                    .foregroundStyle(.pink)
                    .fontWeight(.heavy)
            }
            EmptyView()
        } label: {
            HStack(content: {
                ZStack(content: {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                })
                Text(rowLabel)
            })
        }
    }
}

#Preview {
    List {
        CustomListRowView(rowLabel: "WebSite",
                          rowIcon: "globe",
                          rowContent: nil ,
                          rowTintColor: .pink,
        rowlinkLabel: "Credo Academy",
        rowLinkDestination: "https://credo.academy")
    }
}
