//
//  HousesTabView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/15.
//

import SwiftUI

struct HousesListView: View {
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
                if (vm.model.count > 0) {
                    List(vm.model, id: \.self) { house in
                        NavigationLink {
                            HouseDetailsView(vm: HouseDetailsView.ViewModel(house: house))
                        } label: {
                            ListItemView(vm: ListItemView.ViewModel(image: "",  primaryTitle: "Name", primaryText: house.name ?? "", secondaryTitle: "Region", secondaryText: house.region ?? ""))
                        }.navigationBarTitle("Houses")
                    }
                    .listStyle(.plain)
                    
                    PaginationFooterView(vm: PaginationFooterView.ViewModel(callback: vm.getHousesFromPaginationUrls, pagination: $vm.pagination))
                }
                else {
                    Text("No results found")
                }
            }
        }
        .navigationBarTitle(vm.title)
        .onChange(of: isSearching) { newValue in
            if (!newValue) {
                vm.cancelSearch()
            }
        }
    }
}

struct HousesListView_Previews: PreviewProvider {
    static var previews: some View {
        HousesListView(vm: HousesListView.ViewModel())
    }
}
