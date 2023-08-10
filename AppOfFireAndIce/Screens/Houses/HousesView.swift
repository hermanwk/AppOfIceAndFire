//
//  HousesView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/09.
//

import SwiftUI

struct HousesView: View {
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
                
                ForEach(vm.model, id: \.self) { house in
                    HouseView(vm: HouseView.ViewModel(house: house, navigationStack: vm.$navigationStack))
                }
            }
        }
        .navigationTitle("Houses")
        .safeAreaInset(edge: .bottom, spacing: 0) {
            PaginationFooterView(vm: PaginationFooterView.ViewModel(callback: vm.navigatePagination, pagination: $vm.pagination))
        }
    }
}

struct HousesView_Previews: PreviewProvider {
    static var previews: some View {
        HousesView(vm: HousesView.ViewModel(navigationStack: .constant(Stack<PageModel>())))
    }
}
