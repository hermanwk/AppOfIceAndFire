//
//  CharacterDetailsView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/16.
//

import SwiftUI

struct CharacterDetailsView: View {
    private(set) var vm: ViewModel
    
    var body: some View {
        VStack {
            Group {
                HStack {
                    Text("Name:")
                    Text(vm.model?.name ?? "")
                }
                HStack {
                    Text("Gender:")
                    Text(vm.model?.gender ?? "")
                }
                HStack {
                    Text("Culture:")
                    Text(vm.model?.culture ?? "")
                }
                HStack {
                    Text("Born:")
                    Text(vm.model?.born ?? "")
                }
                HStack {
                    Text("Died:")
                    Text(vm.model?.died ?? "")
                }
            }
            
            Group {
                HStack {
                    Text("Titles:")
                    Text(vm.model?.titles?.joined(separator:", ") ?? "")
                }
                HStack {
                    Text("Aliases:")
                    Text(vm.model?.aliases?.joined(separator:", ") ?? "")
                }
                HStack {
                    Text("Father:")
                    NavigationLink {
                        CharacterDetailsView(vm: CharacterDetailsView.ViewModel(title: "Father of \(vm.model?.name ?? "")", url: vm.model?.father ?? ""))
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
                    Text("Mother:")
                    NavigationLink {
                        CharacterDetailsView(vm: CharacterDetailsView.ViewModel(title: "Mother of \(vm.model?.name ?? "")", url: vm.model?.mother ?? ""))
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
                    Text("Spouse:")
                    NavigationLink {
                        CharacterDetailsView(vm: CharacterDetailsView.ViewModel(title: "Spouse of \(vm.model?.name ?? "")", url: vm.model?.spouse ?? ""))
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
            
            Group {
                HStack {
                    Text("Allegiances:")
                    NavigationLink {
                        HousesListView(vm: HousesListView.ViewModel(title: "Allegiances of \(vm.model?.name ?? "")", urls: vm.model?.allegiances ?? []))
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
                    Text("Books:")
                    NavigationLink {
                        BooksListView(vm: BooksListView.ViewModel(title: "Books featuring \(vm.model?.name ?? "")", urls: vm.model?.books ?? []))
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
                    Text("POV in Books:")
                    Text(vm.model?.povBooks?.joined(separator:", ") ?? "")
                }
                HStack {
                    Text("In TV series:")
                    Text(vm.model?.tvSeries?.joined(separator:", ") ?? "")
                }
                HStack {
                    Text("Played by:")
                    Text(vm.model?.playedBy?.joined(separator:", ") ?? "")
                }
            }
        }.navigationBarTitle(vm.title)
    }
}

struct CharacterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailsView(vm: CharacterDetailsView.ViewModel(character: GoTCharacterDto()))
    }
}
