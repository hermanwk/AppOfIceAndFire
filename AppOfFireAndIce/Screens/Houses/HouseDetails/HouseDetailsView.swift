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
                
                Section {
                    SimpleRowView(title: "Region", text: vm.model?.region ?? "")
                    SimpleRowView(title: "Coat of arms", text: vm.model?.coatOfArms ?? "")
                    SimpleRowView(title: "Words", text: vm.model?.words ?? "")
                    SimpleRowView(title: "Titles", text: vm.model?.titles?.joined(separator:", ") ?? "")
                }
                
                Section {
                    SimpleRowView(title: "Seats", text: vm.model?.seats?.joined(separator:", ") ?? "")
                    HStack {
                        Text("Current lord:")
                        Spacer()
                        NavigationLink {
                            CharacterDetailsView(vm: CharacterDetailsView.ViewModel(title: "Lord of \(vm.model?.name ?? "")", url: vm.model?.currentLord ?? ""))
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
                        Text("Heir:")
                        Spacer()
                        NavigationLink {
                            CharacterDetailsView(vm: CharacterDetailsView.ViewModel(title: "Heir of \(vm.model?.name ?? "")", url: vm.model?.heir ?? ""))
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
                    .padding(.bottom, 6)
                    HStack {
                        Text("Overlord:")
                        Spacer()
                        NavigationLink {
                            CharacterDetailsView(vm: CharacterDetailsView.ViewModel(title: "Overlord of \(vm.model?.name ?? "")", url: vm.model?.overlord ?? ""))
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
                    .padding(.bottom, 6)
                    SimpleRowView(title: "Founded:", text: vm.model?.founded ?? "")
                }
                
                Section {
                    HStack {
                        Text("Founder:")
                        Spacer()
                        NavigationLink {
                            CharacterDetailsView(vm: CharacterDetailsView.ViewModel(title: "Founder of \(vm.model?.name ?? "")", url: vm.model?.founder ?? ""))
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
                    .padding(.bottom, 6)
                    SimpleRowView(title: "Died out:", text: vm.model?.diedOut ?? "")
                    SimpleRowView(title: "Ancestral weapons:", text: vm.model?.ancestralWeapons?.joined(separator:", ") ?? "")
                    HStack {
                        Text("Cadet branches:")
                        Spacer()
                        NavigationLink {
                            HousesListView(vm: HousesListView.ViewModel(title: "Cadet branches of \(vm.model?.name ?? "")", urls: vm.model?.cadetBranches ?? []))
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
                    .padding(.bottom, 6)
                    HStack {
                        Text("Sworn members:")
                        Spacer()
                        NavigationLink {
                            CharactersListView(vm: CharactersListView.ViewModel(title: "Sworn members of \(vm.model?.name ?? "")", urls: vm.model?.swornMembers ?? []))
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
                    .padding(.bottom, 6)
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
