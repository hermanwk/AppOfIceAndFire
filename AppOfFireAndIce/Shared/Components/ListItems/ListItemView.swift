//
//  ListItemView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/15.
//

import Foundation
import SwiftUI

struct ListItemView: View {
    @ObservedObject private(set) var vm: ViewModel
    
    var body: some View {
        VStack {
            HStack() {
                // House crest of the region
                Image(vm.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    HStack() {
                        Text("\(vm.primaryTitle):")
                        Text(vm.primaryText)
                    }
                    
                    if (!vm.secondaryTitle.isEmpty) {
                        HStack {
                            Text("\(vm.secondaryTitle):")
                            Text(vm.secondaryText)
                        }
                    }
                }
                Image("")
            }
        }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(vm: ListItemView.ViewModel(image: "", primaryTitle: "", primaryText: ""))
    }
}
