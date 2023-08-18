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
            if (vm.isLoading) {
                ProgressView()
                    .controlSize(.large)
                    .frame(maxHeight: .infinity, alignment: .center)
                    .frame(maxWidth: .infinity, alignment: .center)
            } else {
                List(vm.model, id: \.self) { book in
                    NavigationLink {
                        BookDetailsView(vm: BookDetailsView.ViewModel(title: "Book Details", book: book))
                    } label: {
                        ListItemView(vm: ListItemView.ViewModel(image: BookThemes.getBookIcon(book: book.mediaType ?? ""),  primaryTitle: "Title", primaryText: book.name ?? "", secondaryTitle: "Media type", secondaryText: book.mediaType ?? ""))
                    }.accentColor(.black)
                }
                .listStyle(.plain)
                
                PaginationFooterView(vm: PaginationFooterView.ViewModel(callback: vm.getBooksFromPaginationUrls, pagination: $vm.pagination))
            }
        }
        .navigationBarTitle(vm.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.cyan, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
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
