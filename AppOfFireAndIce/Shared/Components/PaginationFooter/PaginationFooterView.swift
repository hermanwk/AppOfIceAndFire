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
            HStack (alignment: .center) {
                Button("<<") {
                    vm.callback(vm.pagination.first)
                }
                .disabled(vm.firstDisabled())
                .opacity(vm.firstDisabled() ? 0 : 1)
                .foregroundColor(Color.white)
                .background(Color.black)
                .padding(1)
                
                Button("<") {
                    vm.callback(vm.pagination.prev)
                }
                .disabled(vm.prevDisabled())
                .opacity(vm.prevDisabled() ? 0 : 1)
                .foregroundColor(Color.white)
                .background(Color.black)
                .padding(1)
                
                Text(vm.pagination.currentPage == "" ? "1" : vm.pagination.currentPage)
                    .opacity(vm.displayPageNum() ? 0 : 1)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                
                Button(">") {
                    vm.callback(vm.pagination.next)
                }
                .disabled(vm.nextDisabled())
                .opacity(vm.nextDisabled() ? 0 : 1)
                .foregroundColor(Color.white)
                .background(Color.black)
                .padding(1)
                
                Button(">>") {
                    vm.callback(vm.pagination.last)
                }
                .disabled(vm.lastDisabled())
                .opacity(vm.lastDisabled() ? 0 : 1)
                .foregroundColor(Color.white)
                .background(Color.black)
                .padding(1)
            }
            .font(Font.custom(vm.theme.font(FontName.robotoRegular),
                              size: vm.theme.fontSize(FontSizeName.fontSizeLarge)))
            .padding(.top, 10)
            .frame(minWidth: 0, maxWidth: .infinity)
        }
    }
}

struct PaginationFooterView_Previews: PreviewProvider {
    static var previews: some View {
        PaginationFooterView(vm: PaginationFooterView.ViewModel(callback: {url in }, pagination: .constant(PaginationModel())))
    }
}

