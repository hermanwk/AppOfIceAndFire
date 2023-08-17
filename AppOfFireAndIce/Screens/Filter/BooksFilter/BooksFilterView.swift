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
            
            Text("SUBMIT")
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(8)
                .overlay {
                    NavigationLink(
                        destination: BooksListView(vm: BooksListView.ViewModel(request: vm.getRequest())),
                        label: { EmptyView() }
                    )
                    .opacity(0)
                }
        }
        .navigationBarItems(trailing:
            Image("books")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
        )
    }
}

struct BooksFilterView_Previews: PreviewProvider {
    static var previews: some View {
        BooksFilterView(vm: BooksFilterView.ViewModel())
    }
}
