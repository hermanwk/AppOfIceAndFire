//
//  NavigationBarView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/10.
//

import Foundation
import SwiftUI

struct NavigationBarView<Content>: View where Content: View  {
    var title: String
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.red
                    .opacity(0.1)
                    .ignoresSafeArea()
                
                VStack {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 10)
                        .background(LinearGradient(colors: [.green.opacity(0.3), .blue.opacity(0.5)],
                                                   startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                    
                    content
                }
                .navigationTitle(title)
                .font(.title2)
            }
        }
    }
}
