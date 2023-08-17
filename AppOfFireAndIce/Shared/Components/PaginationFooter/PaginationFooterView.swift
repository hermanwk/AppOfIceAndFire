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
        VStack (spacing: 0) {
            HStack (alignment: .center, spacing: 0) {
                Button("<<") {
                    vm.callback(vm.pagination.first)
                }
                .disabled(vm.pagination.first.isEmpty || vm.pagination.prev.isEmpty)
                .foregroundColor(vm.pagination.first.isEmpty || vm.pagination.prev.isEmpty ? Color.gray : .accentColor)
                .frame(minHeight: 0, maxHeight: .infinity)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(5)
                
                Divider()
                    .frame(width: 1)
                
                Button("<") {
                    vm.callback(vm.pagination.prev)
                }
                .disabled(vm.pagination.prev.isEmpty)
                .foregroundColor(vm.pagination.prev.isEmpty ? Color.gray : .accentColor)
                .frame(minHeight: 0, maxHeight: .infinity)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(5)
                
                Divider()
                    .frame(width: 1)
                
                Text(vm.pagination.currentPage == "" ? "1" : vm.pagination.currentPage)
                    .foregroundColor(Color.black)
                    .frame(minHeight: 0, maxHeight: .infinity)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(5)
                
                Divider()
                    .frame(width: 1)
                
                Button(">") {
                    vm.callback(vm.pagination.next)
                }
                .disabled(vm.pagination.next.isEmpty)
                .foregroundColor(vm.pagination.next.isEmpty ? Color.gray : .accentColor)
                .frame(minHeight: 0, maxHeight: .infinity)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(5)
                
                Divider()
                    .frame(width: 1)
                
                Button(">>") {
                    vm.callback(vm.pagination.last)
                }
                .disabled(vm.pagination.next.isEmpty || vm.pagination.last.isEmpty)
                .foregroundColor(vm.pagination.next.isEmpty || vm.pagination.last.isEmpty ? Color.gray : .accentColor)
                .frame(minHeight: 0, maxHeight: .infinity)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(5)
            }
            .frame(height: 30)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
        }
        .background(Color.white)
        .padding([.trailing, .leading], 60)
        .padding(.bottom, 10)
    }
}

struct PaginationFooterView_Previews: PreviewProvider {
    static var previews: some View {
        PaginationFooterView(vm: PaginationFooterView.ViewModel(callback: {url in }, pagination: .constant(PaginationModel())))
    }
}

