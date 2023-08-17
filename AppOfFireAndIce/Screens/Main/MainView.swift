//
//  MainView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/16.
//

import SwiftUI

struct MainView: View {
    @Environment(\.isSearching) private var isSearching: Bool
    @ObservedObject private(set) var vm: ViewModel
    
    var body: some View {
        NavigationStack() {
            NavigationLink {
                MainFilterView(vm: MainFilterView.ViewModel(selectedTab: vm.selectedTab))
            } label: {
                Text("Advanced Filtering")
            }
            
            TabView(selection: $vm.selectedTab) {
                HousesListView(vm: HousesListView.ViewModel(request: vm.housesRequest, cancelSearch: {
                    vm.cancelSearch()
                }))
                    .tabItem {
                        Label("Houses", systemImage: "crown.fill")
                    }
                    .tag(PageEnum.houses)
                
                CharactersListView(vm: CharactersListView.ViewModel(request: vm.charactersRequest, cancelSearch: {
                    vm.cancelSearch()
                }))
                    .tabItem {
                        Label("Characters", systemImage: "person.crop.circle")
                    }
                    .tag(PageEnum.characters)
                
                BooksListView(vm: BooksListView.ViewModel(request: vm.booksRequest, cancelSearch: {
                    vm.cancelSearch()
                }))
                    .tabItem {
                        Label("Books", systemImage: "book.fill")
                    }
                    .tag(PageEnum.books)
            }
            .navigationTitle("AppOfFireAndIce")
        }
        .searchable(text: $vm.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search by keyword")
        .onSubmit(of: .search) {
            vm.search()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(vm: MainView.ViewModel())
    }
}
