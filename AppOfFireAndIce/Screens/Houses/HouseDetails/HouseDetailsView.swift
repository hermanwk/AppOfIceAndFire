//
//  HouseDetailsView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/15.
//

import SwiftUI

struct HouseDetailsView: View {
    private(set) var vm: ViewModel
    
    var body: some View {
        VStack() {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Text(vm.model?.name ?? "")
                        .font(.title)
                    
                    Spacer()
                    
                    Image(HouseThemes.getOverlordIcon(region: vm.model?.region ?? ""))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                }
                
                Divider()
                
                Group {
                    SimpleRowView(title: "Region", text: vm.model?.region ?? "")
                    SimpleRowView(title: "Coat of arms", text: vm.model?.coatOfArms ?? "")
                    SimpleRowView(title: "Words", text: vm.model?.words ?? "")
                    SimpleRowView(title: "Titles", text: vm.model?.titles?.joined(separator:", ") ?? "")
                    SimpleRowView(title: "Seats", text: vm.model?.seats?.joined(separator:", ") ?? "")
                }
                
                Group {
                    LinkRowView(title: "Current lord", display: !(vm.model?.currentLord?.isEmpty ?? true), navLink: CharacterDetailsView(vm: CharacterDetailsView.ViewModel(title: "Lord of \(vm.model?.name ?? "")", url: vm.model?.currentLord ?? "")))
                    LinkRowView(title: "Heir", display: !(vm.model?.heir?.isEmpty ?? true), navLink: CharacterDetailsView(vm: CharacterDetailsView.ViewModel(title: "Heir of \(vm.model?.name ?? "")", url: vm.model?.heir ?? "")))
                    LinkRowView(title: "Overlord", display: !(vm.model?.overlord?.isEmpty ?? true), navLink:
                        CharacterDetailsView(vm: CharacterDetailsView.ViewModel(title: "Overlord of \(vm.model?.name ?? "")", url: vm.model?.overlord ?? "")))
                    SimpleRowView(title: "Founded:", text: vm.model?.founded ?? "")
                    LinkRowView(title: "Founder", display: !(vm.model?.founder?.isEmpty ?? true), navLink: CharacterDetailsView(vm: CharacterDetailsView.ViewModel(title: "Founder of \(vm.model?.name ?? "")", url: vm.model?.founder ?? "")))
                }
                
                Group {
                    SimpleRowView(title: "Died out:", text: vm.model?.diedOut ?? "")
                    SimpleRowView(title: "Ancestral weapons:", text: vm.model?.ancestralWeapons?.joined(separator:", ") ?? "")
                    LinkRowView(title: "Cadet branches", display: vm.model?.cadetBranches?.count ?? 0 > 0, navLink: HousesListView(vm: HousesListView.ViewModel(title: "Cadet branches of \(vm.model?.name ?? "")", urls: vm.model?.cadetBranches ?? [])))
                    LinkRowView(title: "Sworn members", display: vm.model?.swornMembers?.count ?? 0 > 0, navLink: CharactersListView(vm: CharactersListView.ViewModel(title: "Sworn members of \(vm.model?.name ?? "")", urls: vm.model?.swornMembers ?? [])))
                }
            }
            .navigationBarTitle(vm.title)
            .tint(Color.black)
            .accentColor(Color.black)
            .toolbarBackground(HouseThemes.getOverlordColor(region: vm.model?.region ?? ""), for: .navigationBar)
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

struct HouseDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        HouseDetailsView(vm: HouseDetailsView.ViewModel(house: GoTHouseDto()))
    }
}
