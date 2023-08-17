//
//  CharactersFilterView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/16.
//

import SwiftUI

struct CharactersFilterView: View {
    @ObservedObject private(set) var vm: ViewModel
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $vm.name)
                    .textContentType(.name)
                    .keyboardType(.default)
                    .help("Characters with the given name are included")
                
                ThreeStateToggleView(vm: ThreeStateToggleView.ViewModel(label: "Gender", firstOption: "Male", secondOption: "Femals", value: $vm.gender))
                    .help("Characters with the given gender are included")
                
                TextField("Culture", text: $vm.culture)
                    .keyboardType(.default)
                    .help("Characters with the given culture are included")
            }
            
            Section {
                TextField("Year born", text: $vm.born)
                    .keyboardType(.default)
                    .help("Characters that were born this given year are included")
                
                TextField("Year died", text: $vm.died)
                    .keyboardType(.default)
                    .help("Characters that died this given year are included")
            }
            
            Section {
                ThreeStateToggleView(vm: ThreeStateToggleView.ViewModel(label: "Currently alive", value: $vm.isAlive))
                    .help("Characters that are alive or dead (depending on the value) are included")
            }
            
            Text("SUBMIT")
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(8)
                .overlay {
                    NavigationLink(
                        destination: CharactersListView(vm: CharactersListView.ViewModel(request: vm.getRequest())),
                        label: { EmptyView() }
                    )
                    .opacity(0)
                }
        }
        .navigationBarItems(trailing:
            Image("characters")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
        )
    }
}

struct CharactersFilterView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersFilterView(vm: CharactersFilterView.ViewModel())
    }
}
