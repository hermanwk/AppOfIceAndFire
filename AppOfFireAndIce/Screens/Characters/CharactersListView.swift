//
//  CharactersListView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/16.
//

import SwiftUI

struct CharactersListView: View {
    @Environment(\.isSearching) private var isSearching: Bool
    @ObservedObject private(set) var vm: ViewModel
    
    var body: some View {
        VStack {
            List(vm.model, id: \.self) { character in
                NavigationLink {
                    CharacterDetailsView(vm: CharacterDetailsView.ViewModel(character: character))
                } label: {
                    ListItemView(vm: ListItemView.ViewModel(image: "",  primaryTitle: vm.getPrimaryTitleText(character: character)[0], primaryText: vm.getPrimaryTitleText(character: character)[1], secondaryTitle: vm.getSecondaryTitleText(character: character)[0], secondaryText: vm.getSecondaryTitleText(character: character)[1]))
                }.navigationBarTitle("Character Details")
            }
            .listStyle(.plain)
            
            PaginationFooterView(vm: PaginationFooterView.ViewModel(callback: vm.getCharactersFromPaginationUrls, pagination: $vm.pagination))
        }
        .navigationBarTitle(vm.title)
        .onChange(of: isSearching) { newValue in
            if (!newValue) {
                vm.cancelSearch()
            }
        }
    }
}

struct CharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView(vm: CharactersListView.ViewModel())
    }
}
