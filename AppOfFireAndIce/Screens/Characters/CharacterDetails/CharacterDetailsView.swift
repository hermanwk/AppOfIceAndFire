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
                    SimpleRowView(title: "Titles", text: vm.model?.titles?.joined(separator:", ") ?? "")
                }
                
                Group {
                    SimpleRowView(title: "Aliases", text: vm.model?.aliases?.joined(separator:", ") ?? "")
                    LinkRowView(title: "Father", display: !(vm.model?.father?.isEmpty ?? true), navLink: CharacterDetailsView(vm: CharacterDetailsView.ViewModel(title: "Father of \(vm.model?.name ?? "")", url: vm.model?.father ?? "")))
                    LinkRowView(title: "Mother", display: !(vm.model?.mother?.isEmpty ?? true), navLink: CharacterDetailsView(vm: CharacterDetailsView.ViewModel(title: "Mother of \(vm.model?.name ?? "")", url: vm.model?.mother ?? "")))
                    LinkRowView(title: "Spouse", display: !(vm.model?.spouse?.isEmpty ?? true), navLink: CharacterDetailsView(vm: CharacterDetailsView.ViewModel(title: "Spouse of \(vm.model?.name ?? "")", url: vm.model?.spouse ?? "")))
                    LinkRowView(title: "Allegiances", display: vm.model?.allegiances?.count ?? 0 > 0, navLink: HousesListView(vm: HousesListView.ViewModel(title: "Allegiances of \(vm.model?.name ?? "")", urls: vm.model?.allegiances ?? [])))
                }
                
                Group {
                    LinkRowView(title: "Books", display: vm.model?.books?.count ?? 0 > 0, navLink: BooksListView(vm: BooksListView.ViewModel(title: "Books featuring \(vm.model?.name ?? "")", urls: vm.model?.books ?? [])))
                    LinkRowView(title: "POV in Books", display: vm.model?.povBooks?.count ?? 0 > 0, navLink: BooksListView(vm: BooksListView.ViewModel(title: "POV in \(vm.model?.name ?? "")", urls: vm.model?.books ?? [])))
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
