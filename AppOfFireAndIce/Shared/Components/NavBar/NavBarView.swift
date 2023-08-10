//
//  NavBarView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/10.
//

import Foundation
import SwiftUI

struct CustomNavBar: View {
    let title: String
    let gradient = LinearGradient(colors: [Color.black, Color.red], startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        NavigationStack {
            ZStack {
                gradient
                    .opacity(0.25)
                    .ignoresSafeArea()
                
                VStack {
                    Text("Background colors can be seen behind the NavigationStack")
                        .padding()
                    Spacer()
                }
                .navigationTitle(title)
                .font(.title2)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
