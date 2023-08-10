//
//  CharactersView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/09.
//

import SwiftUI

struct CharactersView: View {
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
                
                ForEach(vm.model, id: \.self) { character in
                    CharacterView(vm: CharacterView.ViewModel(character: character, navigationStack: vm.$navigationStack))
                }
            }
        }
        .navigationTitle("Characters")
        .safeAreaInset(edge: .bottom, spacing: 0) {
            PaginationFooterView(vm: PaginationFooterView.ViewModel(callback: vm.navigatePagination, pagination: $vm.pagination))
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView(vm: CharactersView.ViewModel(navigationStack: .constant(Stack<PageModel>())))
    }
}
