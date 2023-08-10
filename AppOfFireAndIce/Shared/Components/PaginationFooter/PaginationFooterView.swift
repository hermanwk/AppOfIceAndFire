//
//  PaginationFooterView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/10.
//

import Foundation
import SwiftUI

struct PaginationFooterView: View {
    private(set) var vm: ViewModel
    
    var body: some View {
        HStack (alignment: .center) {
            Button("FIRST") {
                vm.callback(vm.pagination.first)
            }
            .disabled(vm.firstDisabled())
            .foregroundColor(vm.firstDisabled() ? Color.gray : Color.white)
            .background(vm.firstDisabled() ? vm.theme.color(ColorName.lightGray) : Color.black)
            .padding(1)
            .cornerRadius(8)
            
            Button("PREV") {
                vm.callback(vm.pagination.prev)
            }
            .disabled(vm.prevDisabled())
            .foregroundColor(vm.prevDisabled() ? Color.gray : Color.white)
            .background(vm.prevDisabled() ? vm.theme.color(ColorName.lightGray) : Color.black)
            .padding(1)
            .cornerRadius(8)
            
            Text(vm.pagination.currentPage == "" ? "1" : vm.pagination.currentPage)
                .foregroundColor(Color.white)
                .background(Color.black)
                .padding(1)
                .cornerRadius(8)
            
            Button("NEXT") {
                vm.callback(vm.pagination.next)
            }
            .disabled(vm.nextDisabled())
            .foregroundColor(vm.nextDisabled() ? Color.gray : Color.white)
            .background(vm.nextDisabled() ? vm.theme.color(ColorName.lightGray) : Color.black)
            .padding(1)
            .cornerRadius(8)
            
            Button("LAST") {
                vm.callback(vm.pagination.last)
            }
            .disabled(vm.lastDisabled())
            .foregroundColor(vm.lastDisabled() ? Color.gray : Color.white)
            .background(vm.lastDisabled() ? vm.theme.color(ColorName.lightGray) : Color.black)
            .padding(1)
            .cornerRadius(8)
        }
        .font(Font.custom(vm.theme.font(FontName.robotoRegular),
                          size: vm.theme.fontSize(FontSizeName.fontSizeLarge)))
        .padding(.top, 10)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(LinearGradient(colors: [.yellow, .orange], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct PaginationFooterView_Previews: PreviewProvider {
    static var previews: some View {
        PaginationFooterView(vm: PaginationFooterView.ViewModel(callback: {url in }, pagination: .constant(PaginationModel())))
    }
}

