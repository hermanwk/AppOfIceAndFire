//
//  MainFilterView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/16.
//

import SwiftUI

struct MainFilterView: View {
    @ObservedObject private(set) var vm: ViewModel
    
    var body: some View {
        TabView(selection: $vm.selectedTab) {
            HousesFilterView(vm: HousesFilterView.ViewModel())
                .tabItem {
                    Label("Houses", systemImage: "crown.fill")
                }
                .tag(PageEnum.houses)
            
            CharactersFilterView(vm: CharactersFilterView.ViewModel())
                .tabItem {
                    Label("Characters", systemImage: "person.crop.circle")
                }
                .tag(PageEnum.characters)
            
            BooksFilterView(vm: BooksFilterView.ViewModel())
                .tabItem {
                    Label("Books", systemImage: "book.fill")
                }
                .tag(PageEnum.books)
        }
        .navigationBarTitle("\(vm.getSearchType()) search")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.cyan, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationBarItems(trailing:
            Image(vm.getSearchType().lowercased())
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
        )
    }
}

struct MainFilterView_Previews: PreviewProvider {
    static var previews: some View {
        MainFilterView(vm: MainFilterView.ViewModel())
    }
}
