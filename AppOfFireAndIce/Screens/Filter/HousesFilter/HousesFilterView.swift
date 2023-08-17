//
//  HousesFilterView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/16.
//

import SwiftUI

struct HousesFilterView: View {
    @ObservedObject private(set) var vm: ViewModel
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $vm.name)
                    .textContentType(.name)
                    .keyboardType(.default)
                    .help("Houses with the given name are included")
                
                TextField("Region", text: $vm.region)
                    .textContentType(.location)
                    .keyboardType(.default)
                    .help("Houses that belong in the given region are included")
                
                TextField("Words", text: $vm.words)
                    .keyboardType(.default)
                    .help("Houses that have the given words are included")
            }
            
            Section {
                ThreeStateToggleView(vm: ThreeStateToggleView.ViewModel(label: "Has words", value: $vm.hasWords))
                    .help("Houses that have words (or not) are included")
                
                ThreeStateToggleView(vm: ThreeStateToggleView.ViewModel(label: "Has titles", value: $vm.hasTitles))
                    .help("Houses that have titles (or not) are included")

                ThreeStateToggleView(vm: ThreeStateToggleView.ViewModel(label: "Has seats", value: $vm.hasSeats))
                    .help("Houses that have seats (or not) are included")

                ThreeStateToggleView(vm: ThreeStateToggleView.ViewModel(label: "Has died out", value: $vm.hasDiedOut))
                    .help("Houses that are extinct are included")

                ThreeStateToggleView(vm: ThreeStateToggleView.ViewModel(label: "Has ancestral weapons", value: $vm.hasAncestralWeapons))
                    .help("Houses that have ancestral weapons (or not) are included")
            }
            
            NavigationLink {
                HousesListView(vm: HousesListView.ViewModel(request: vm.getRequest()))
            } label: {
                Text("SUBMIT")
            }
        }
    }
}

struct HousesFilterView_Previews: PreviewProvider {
    static var previews: some View {
        HousesFilterView(vm: HousesFilterView.ViewModel())
    }
}
