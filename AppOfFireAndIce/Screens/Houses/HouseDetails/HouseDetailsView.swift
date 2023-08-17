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
        VStack(alignment: .leading) {
            Group {
                HStack {
                    Text("Name:")
                    Text(vm.model?.name ?? "")
                }
                HStack {
                    Text("Region:")
                    Text(vm.model?.region ?? "")
                }
                HStack {
                    Text("Coat of arms:")
                    Text(vm.model?.coatOfArms ?? "")
                }
                HStack {
                    Text("Words:")
                    Text(vm.model?.words ?? "")
                }
                HStack {
                    Text("Titles:")
                    Text(vm.model?.titles?.joined(separator:", ") ?? "")
                }
            }

            Group {
                HStack {
                    Text("Seats:")
                    Text(vm.model?.seats?.joined(separator:", ") ?? "")
                }
                HStack {
                    Text("Current lord:")
                    NavigationLink {
                        CharacterDetailsView(vm: CharacterDetailsView.ViewModel(title: "Lord of \(vm.model?.name ?? "")", url: vm.model?.currentLord ?? ""))
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
                    Text("Heir:")
                    NavigationLink {
                        CharacterDetailsView(vm: CharacterDetailsView.ViewModel(title: "Heir of \(vm.model?.name ?? "")", url: vm.model?.heir ?? ""))
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
                    Text("Overlord:")
                    NavigationLink {
                        CharacterDetailsView(vm: CharacterDetailsView.ViewModel(title: "Overlord of \(vm.model?.name ?? "")", url: vm.model?.overlord ?? ""))
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
                    Text("Founded")
                    Text(vm.model?.founded ?? "")
                }
            }

            Group {
                HStack {
                    Text("Founder:")
                    NavigationLink {
                        CharacterDetailsView(vm: CharacterDetailsView.ViewModel(title: "Founder of \(vm.model?.name ?? "")", url: vm.model?.founder ?? ""))
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
                    Text("Died out")
                    Text(vm.model?.diedOut ?? "")
                }
                HStack {
                    Text("Ancestral weapons")
                    Text(vm.model?.ancestralWeapons?.joined(separator:", ") ?? "")
                }
                HStack {
                    Text("Cadet branches:")
                    NavigationLink {
                        HousesListView(vm: HousesListView.ViewModel(title: "Cadet branches of \(vm.model?.name ?? "")", urls: vm.model?.cadetBranches ?? []))
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
                    Text("Sworn members:")
                    NavigationLink {
                        CharactersListView(vm: CharactersListView.ViewModel(title: "Sworn members of \(vm.model?.name ?? "")", urls: vm.model?.swornMembers ?? []))
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
        }
        .navigationBarTitle(vm.title)
    }
}

struct HouseDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        HouseDetailsView(vm: HouseDetailsView.ViewModel(house: GoTHouseDto()))
    }
}
