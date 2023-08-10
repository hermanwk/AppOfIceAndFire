//
//  RowView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/10.
//

import Foundation
import SwiftUI

struct ReadOnlyRowView: View {
    private(set) var vm: ViewModel
    
    var body: some View {
        if (vm.value != "") {
            HStack{
                Text("\(vm.title):")
                    .foregroundColor(Color.white)
                    .frame(minWidth: 20, maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                    .background(Color.black)
                Text(vm.value)
                    .foregroundColor(Color.black)
                    .background(vm.theme.color(vm.background))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .font(Font.custom(vm.theme.font(FontName.robotoRegular),
                              size: vm.theme.fontSize(FontSizeName.fontSizeLarge)))
            .background(vm.theme.color(vm.background))
            .frame(maxWidth: .infinity, alignment: .center)
            .cornerRadius(8)
            .padding([.leading, .trailing], 20)
            .padding([.top, .bottom], 10)
        }
    }
}

struct ReadOnlyRowView_Previews: PreviewProvider {
    static var previews: some View {
        ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "", value: ""))
    }
}
