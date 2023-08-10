//
//  HouseView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/10.
//

import SwiftUI

struct HouseView: View {
    private(set) var vm: ViewModel
    
    var body: some View {
        VStack {
            Group {
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "Name", value: vm.model.name ?? "", background: ColorName.orangePrimaryColor))
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "Region", value: vm.model.region ?? "", background: ColorName.orangeSecondaryColor))
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "Coat of arms", value: vm.model.coatOfArms ?? "", background: ColorName.orangeTertiaryColor))
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "Words", value: vm.model.words ?? "", background: ColorName.orangePrimaryColor))
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "Titles", value: vm.model.titles?.joined(separator:", ") ?? "", background: ColorName.orangeSecondaryColor))
            }
            
            Group {
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "Seats", value: vm.model.seats?.joined(separator:", ") ?? "", background: ColorName.orangeTertiaryColor))
                ClickableRowView(vm: ClickableRowView.ViewModel(title: "Current lord", type: PageEnum.characters, value: [vm.model.currentLord ?? ""], background: ColorName.orangePrimaryColor, navigationStack: vm.$navigationStack))
                ClickableRowView(vm: ClickableRowView.ViewModel(title: "Heir", type: PageEnum.characters, value: [vm.model.heir ?? ""], background: ColorName.orangeSecondaryColor, navigationStack: vm.$navigationStack))
                ClickableRowView(vm: ClickableRowView.ViewModel(title: "Overlord", type: PageEnum.characters, value: [vm.model.overlord ?? ""], background: ColorName.orangeTertiaryColor, navigationStack: vm.$navigationStack))
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "Founded", value: vm.model.founded ?? "", background: ColorName.orangePrimaryColor))
            }
            
            Group {
                ClickableRowView(vm: ClickableRowView.ViewModel(title: "Founder", type: PageEnum.characters, value: [vm.model.founder ?? ""], background: ColorName.orangeSecondaryColor, navigationStack: vm.$navigationStack))
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "Died out", value: vm.model.diedOut ?? "", background: ColorName.orangeTertiaryColor))
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "Ancestral weapons", value: vm.model.ancestralWeapons?.joined(separator:", ") ?? "", background: ColorName.orangePrimaryColor))
                ClickableRowView(vm: ClickableRowView.ViewModel(title: "Cadet branches", type: PageEnum.houses, value: vm.model.cadetBranches ?? [], background: ColorName.orangeSecondaryColor, navigationStack: vm.$navigationStack))
                ClickableRowView(vm: ClickableRowView.ViewModel(title: "Sworn members", type: PageEnum.characters, value: vm.model.swornMembers ?? [], background: ColorName.orangeTertiaryColor, navigationStack: vm.$navigationStack))
            }
        }
        .background(vm.theme.color(ColorName.darkGray))
        .cornerRadius(8)
        .padding(20)
    }
}

struct HouseView_Previews: PreviewProvider {
    static var previews: some View {
        HouseView(vm: HouseView.ViewModel(house: GoTHouseDto(), navigationStack: .constant(Stack<PageModel>())))
    }
}
