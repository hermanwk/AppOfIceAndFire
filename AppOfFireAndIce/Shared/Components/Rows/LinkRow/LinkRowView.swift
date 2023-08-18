//
//  LinkRowView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/17.
//

import SwiftUI

struct LinkRowView: View {
    var title: String
    var display: Bool
    var navLink: any View
    
    var body: some View {
        if (display) {
            HStack {
                Text("\(title):")
                Spacer()
                NavigationLink {
                    AnyView(navLink)
                } label: {
                    HStack {
                        Text("Show more")
                            .foregroundColor(Color.blue)
                        Image(systemName: "rectangle.portrait.and.arrow.forward")
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width: 14, height: 14)
                    }
                }
            }
        }
    }
}

struct LinkRowView_Previews: PreviewProvider {
    static var previews: some View {
        LinkRowView(title: "", display: false, navLink: EmptyView())
    }
}
