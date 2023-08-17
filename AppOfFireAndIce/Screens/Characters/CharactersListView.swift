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
            if (vm.isLoading) {
                ProgressView()
                    .controlSize(.large)
                    .frame(maxHeight: .infinity, alignment: .center)
                    .frame(maxWidth: .infinity, alignment: .center)
            } else {
                List(vm.model, id: \.self) { character in
                    NavigationLink {
                        CharacterDetailsView(vm: CharacterDetailsView.ViewModel(title: "Character Details", character: character))
                    } label: {
                        ListItemView(vm: ListItemView.ViewModel(image: CharacterThemes.getGenderIcon(gender:  character.gender ?? ""), primaryTitle: CharacterThemes.getCharacterIdentifier(character: character)[0], primaryText: CharacterThemes.getCharacterIdentifier(character: character)[1], secondaryTitle: vm.getSecondaryTitleText(character: character)[0], secondaryText: vm.getSecondaryTitleText(character: character)[1]))
                    }.accentColor(.black)
                }
                .listStyle(.plain)
                
                PaginationFooterView(vm: PaginationFooterView.ViewModel(callback: vm.getCharactersFromPaginationUrls, pagination: $vm.pagination))
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

struct CharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView(vm: CharactersListView.ViewModel())
    }
}
