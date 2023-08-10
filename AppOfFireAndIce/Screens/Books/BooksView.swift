//
//  BooksView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/09.
//

import SwiftUI

struct BooksView: View {
    @ObservedObject private(set) var vm: ViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                if (vm.isLoading) {
                    ProgressView()
                        .tint(Color.red)
                        .controlSize(.large)
                        .frame(maxHeight: .infinity, alignment: .center)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                ForEach(vm.model, id: \.self) { book in
                    BookView(vm: BookView.ViewModel(book: book, navigationStack: vm.$navigationStack))
                }
            }
        }
        .navigationTitle("Books")
        .safeAreaInset(edge: .bottom, spacing: 0) {
            PaginationFooterView(vm: PaginationFooterView.ViewModel(callback: vm.navigatePagination, pagination: $vm.pagination))
        }
    }
}

struct BooksView_Previews: PreviewProvider {
    static var previews: some View {
        BooksView(vm: BooksView.ViewModel(navigationStack: .constant(Stack<PageModel>())))
    }
}
