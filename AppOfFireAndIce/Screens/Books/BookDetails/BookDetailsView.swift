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
        VStack {
            Group {
                HStack {
                    Text("Name:")
                    Text(vm.model?.name ?? "")
                }
                HStack {
                    Text("ISBN:")
                    Text(vm.model?.isbn ?? "")
                }
                HStack {
                    Text("Authors:")
                    Text(vm.model?.authors?.joined(separator:", ") ?? "")
                }
                HStack {
                    Text("Number of page:")
                    Text(vm.model?.numberOfPages?.description ?? "")
                }
                HStack {
                    Text("Publisher:")
                    Text(vm.model?.publisher ?? "")
                }
            }
            
            Group {
                HStack {
                    Text("Country:")
                    Text(vm.model?.country ?? "")
                }
                HStack {
                    Text("Media type:")
                    Text(vm.model?.mediaType ?? "")
                }
                HStack {
                    Text("Released:")
                    Text(vm.model?.released ?? "")
                }
                HStack {
                    Text("Characters:")
                    NavigationLink {
                        CharactersListView(vm: CharactersListView.ViewModel(title: "Characters in \(vm.model?.name ?? "")", urls: vm.model?.characters ?? []))
                    } label: {
                        HStack {
                            Text("Show more")
                            Image(systemName: "rectangle.portrait.and.arrow.forward")
                                .resizable()
                                .foregroundColor(Color.black)
                                .frame(width: 14, height: 14)
                        }
                    }
                }
                HStack {
                    Text("POV Character:")
                    NavigationLink {
                        CharactersListView(vm: CharactersListView.ViewModel(title: "POV Characters in \(vm.model?.name ?? "")", urls: vm.model?.povCharacters ?? []))
                    } label: {
                        HStack {
                            Text("Show more")
                            Image(systemName: "rectangle.portrait.and.arrow.forward")
                                .resizable()
                                .foregroundColor(Color.black)
                                .frame(width: 14, height: 14)
                        }
                    }
                }
            }
        }.navigationBarTitle(vm.title)
    }
}

struct BookDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailsView(vm: BookDetailsView.ViewModel(book: GoTBookDto()))
    }
}

