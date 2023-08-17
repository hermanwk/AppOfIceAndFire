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
        VStack() {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Text(CharacterThemes.getCharacterIdentifier(character: vm.model)[1])
                        .font(.title)
                    
                    Spacer()
                    
                    Image(CharacterThemes.getGenderIcon(gender: vm.model?.gender ?? ""))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                }
                
                Divider()
                
                Group {
                    SimpleRowView(title: "Gender", text: vm.model?.gender ?? "")
                    SimpleRowView(title: "Culture", text: vm.model?.culture ?? "")
                    SimpleRowView(title: "Born", text: vm.model?.born ?? "")
                    SimpleRowView(title: "Died", text: vm.model?.died ?? "")
                }
                
                Group {
                    SimpleRowView(title: "Titles", text: vm.model?.titles?.joined(separator:", ") ?? "")
                    SimpleRowView(title: "Aliases", text: vm.model?.aliases?.joined(separator:", ") ?? "")
                    HStack {
                        Text("Father:")
                        Spacer()
                        NavigationLink {
                            CharacterDetailsView(vm: CharacterDetailsView.ViewModel(title: "Father of \(vm.model?.name ?? "")", url: vm.model?.father ?? ""))
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
                        Text("Mother:")
                        Spacer()
                        NavigationLink {
                            CharacterDetailsView(vm: CharacterDetailsView.ViewModel(title: "Mother of \(vm.model?.name ?? "")", url: vm.model?.mother ?? ""))
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
                        Text("Spouse:")
                        Spacer()
                        NavigationLink {
                            CharacterDetailsView(vm: CharacterDetailsView.ViewModel(title: "Spouse of \(vm.model?.name ?? "")", url: vm.model?.spouse ?? ""))
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
                
                Group {
                    HStack {
                        Text("Allegiances:")
                        Spacer()
                        NavigationLink {
                            HousesListView(vm: HousesListView.ViewModel(title: "Allegiances of \(vm.model?.name ?? "")", urls: vm.model?.allegiances ?? []))
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
                        Text("Books:")
                        Spacer()
                        NavigationLink {
                            BooksListView(vm: BooksListView.ViewModel(title: "Books featuring \(vm.model?.name ?? "")", urls: vm.model?.books ?? []))
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
                    SimpleRowView(title: "POV in Books", text: vm.model?.povBooks?.joined(separator:", ") ?? "")
                    SimpleRowView(title: "In TV series", text: vm.model?.tvSeries?.joined(separator:", ") ?? "")
                    SimpleRowView(title: "Played by", text: vm.model?.playedBy?.joined(separator:", ") ?? "")
                }
            }
            .navigationBarTitle(vm.title)
            .tint(Color.black)
            .accentColor(Color.black)
            .toolbarBackground(CharacterThemes.getCharacterColor(gender: vm.model?.gender ?? ""), for: .navigationBar)
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

struct CharacterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailsView(vm: CharacterDetailsView.ViewModel(character: GoTCharacterDto()))
    }
}
