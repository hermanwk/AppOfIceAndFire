//
//  BooksFilterView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/16.
//

import SwiftUI

struct BooksFilterView: View {
    @ObservedObject private(set) var vm: ViewModel
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $vm.name)
                    .textContentType(.name)
                    .keyboardType(.default)
                    .help("Books with the given name are included")
            }
            
            Section {
                CollapsableContainerView(title: "From release date", onLabel: "REMOVE", offLabel: "ADD", displaySection: vm.includeFromDate, content: {
                    DatePicker("", selection: $vm.fromReleaseDate, in: vm.getFirstPublishingDate()...Date(), displayedComponents: [.date])
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .frame(maxHeight: 400)
                }).help("Books that were released after, or on, the given date are included")
            }
            
            Section {
                CollapsableContainerView(title: "To release date", onLabel: "REMOVE", offLabel: "ADD", displaySection: vm.includeFromDate, content: {
                    DatePicker("", selection: $vm.toReleaseDate, in: vm.getFirstPublishingDate()...Date(), displayedComponents: [.date])
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .frame(maxHeight: 400)
                }).help("Books that were released before, or on, the given date are included")
            }
            
            NavigationLink {
                BooksListView(vm: BooksListView.ViewModel(request: vm.getRequest()))
            } label: {
                Text("SUBMIT")
            }
        }.navigationBarTitle("Book search")
    }
}

struct BooksFilterView_Previews: PreviewProvider {
    static var previews: some View {
        BooksFilterView(vm: BooksFilterView.ViewModel())
    }
}
