//
//  BooksListView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/16.
//

import SwiftUI

struct BooksListView: View {
    @Environment(\.isSearching) private var isSearching: Bool
    @ObservedObject private(set) var vm: ViewModel
    
    var body: some View {
        VStack {
            List(vm.model, id: \.self) { book in
                NavigationLink {
                    BookDetailsView(vm: BookDetailsView.ViewModel(book: book))
                } label: {
                    ListItemView(vm: ListItemView.ViewModel(image: "",  primaryTitle: "Title", primaryText: book.name ?? "", secondaryTitle: "Media type", secondaryText: book.mediaType ?? ""))
                }.navigationBarTitle("Book Details")
            }
            .listStyle(.plain)
            
            PaginationFooterView(vm: PaginationFooterView.ViewModel(callback: vm.getBooksFromPaginationUrls, pagination: $vm.pagination))
        }
        .navigationBarTitle(vm.title)
        .onChange(of: isSearching) { newValue in
            if (!newValue) {
                vm.cancelSearch()
            }
        }
    }
}

struct BooksListView_Previews: PreviewProvider {
    static var previews: some View {
        BooksListView(vm: BooksListView.ViewModel())
    }
}
