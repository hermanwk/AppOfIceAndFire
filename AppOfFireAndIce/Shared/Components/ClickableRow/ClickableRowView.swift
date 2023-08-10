//
//  ClickableRowView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/10.
//

import Foundation
import SwiftUI

struct ClickableRowView: View {
    private(set) var vm: ViewModel
    
    var body: some View {
        if (vm.value.count > 0 && vm.value[0] != "") {
            HStack{
                Button(action: {
                    vm.navigate()
                }) {
                    HStack(alignment: .center) {
                        Text("\(vm.title) (\(vm.value.count))")
                            .foregroundColor(Color.black)
                            .font(Font.custom(vm.theme.font(FontName.robotoRegular),
                                              size: vm.theme.fontSize(FontSizeName.fontSizeLarge)))
                        
                        Image(systemName: "rectangle.portrait.and.arrow.forward")
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width: 14, height: 14)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .frame(height: 50)
            .background(vm.theme.color(vm.background))
            .cornerRadius(8)
            .padding([.leading, .trailing], 20)
            .padding([.top, .bottom], 10)
        }
    }
}

struct ClickableRowView_Previews: PreviewProvider {
    static var previews: some View {
        ClickableRowView(vm: ClickableRowView.ViewModel(title: "", type: PageEnum.home, value: [], navigationStack: .constant(Stack<PageModel>())))
    }
}

