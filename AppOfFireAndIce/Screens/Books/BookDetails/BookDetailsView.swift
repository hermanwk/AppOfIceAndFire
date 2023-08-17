//
//  BookDetailsView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/16.
//

import SwiftUI

struct BookDetailsView: View {
    private(set) var vm: ViewModel
    
    var body: some View {
        VStack() {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Text(vm.model?.name ?? "")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                    
                    Image(BookThemes.getBookImage(book: vm.model?.name ?? ""))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
                
                Divider()
                    
                Group {
                    SimpleRowView(title: "ISBN", text: vm.model?.isbn ?? "")
                    SimpleRowView(title: "Authors", text: vm.model?.authors?.joined(separator:", ") ?? "")
                    SimpleRowView(title: "Number of page", text: vm.model?.numberOfPages?.description ?? "" )
                  SimpleRowView(title: "Publisher", text: vm.model?.publisher ?? "")
                }
                
                Group {
                    SimpleRowView(title: "Country", text: vm.model?.country ?? "")
                    SimpleRowView(title: "Media type", text: vm.model?.mediaType ?? "")
                    SimpleRowView(title: "Released", text: vm.model?.released ?? "")
                    HStack {
                        Text("Characters:")
                        Spacer()
                        NavigationLink {
                            CharactersListView(vm: CharactersListView.ViewModel(title: "Characters in \(vm.model?.name ?? "")", urls: vm.model?.characters ?? []))
                        } label: {
                            HStack {
                                Text("Show more")
                                    .foregroundColor(Color.blue)
                                Image(systemName: "rectangle.portrait.and.arrow.forward")
                                    .resizable()
                                    .foregroundColor(Color.black)
                                    .frame(width: 14, height: 14)
                            }
                        }
                    }
                    HStack {
                        Text("POV Character:")
                        Spacer()
                        NavigationLink {
                            CharactersListView(vm: CharactersListView.ViewModel(title: "POV Characters in \(vm.model?.name ?? "")", urls: vm.model?.povCharacters ?? []))
                        } label: {
                            HStack {
                                Text("Show more")
                                    .foregroundColor(Color.blue)
                                Image(systemName: "rectangle.portrait.and.arrow.forward")
                                    .resizable()
                                    .foregroundColor(Color.black)
                                    .frame(width: 14, height: 14)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(vm.title)
            .tint(Color.black)
            .accentColor(Color.black)
            .toolbarBackground(BookThemes.getBookColor(book: vm.model?.name ?? ""), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .padding(20)
            .background(Color.white)
            .cornerRadius(20)
            
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(minHeight: 0, maxHeight: .infinity)
        .padding(20)
        .background(Color("backgroundColor"))
    }
}

struct BookDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailsView(vm: BookDetailsView.ViewModel(book: GoTBookDto()))
    }
}

