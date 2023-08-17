//
//  SimpleRowView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/17.
//

import SwiftUI

struct SimpleRowView: View {
    var title: String
    var text: String = ""
    
    var body: some View {
        if !text.isEmpty {
            HStack(alignment: .top) {
                Text("\(title):")
                    .frame(minWidth: 130, alignment: .leading)
                
                Text(text)
                
                Spacer()
            }
            .padding(.bottom, 6)
            .frame(minWidth: 0, maxWidth: .infinity)
        }
    }
}

struct SimpleRowView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleRowView(title: "", text: "")
    }
}
