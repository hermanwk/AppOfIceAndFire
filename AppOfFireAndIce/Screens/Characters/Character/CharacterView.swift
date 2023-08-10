//
//  CharacterView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/10.
//

import SwiftUI

struct CharacterView: View {
    private(set) var vm: ViewModel
    
    var body: some View {
        VStack {
            Group {
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "Name", value: vm.model.name ?? "", background: ColorName.orangePrimaryColor))
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "Gender", value: vm.model.gender ?? "", background: ColorName.orangeSecondaryColor))
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "Culture", value: vm.model.culture ?? "", background: ColorName.orangeTertiaryColor))
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "Born", value: vm.model.born ?? "", background: ColorName.orangePrimaryColor))
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "Died", value: vm.model.died ?? "", background: ColorName.orangeSecondaryColor))
            }
            
            Group {
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "Titles", value: vm.model.titles?.joined(separator:", ") ?? "", background: ColorName.orangeTertiaryColor))
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "Aliases", value: vm.model.aliases?.joined(separator:", ") ?? "", background: ColorName.orangePrimaryColor))
                ClickableRowView(vm: ClickableRowView.ViewModel(title: "Father", type: PageEnum.characters, value: [vm.model.father ?? ""], background: ColorName.orangeSecondaryColor, navigationStack: vm.$navigationStack))
                ClickableRowView(vm: ClickableRowView.ViewModel(title: "Mother", type: PageEnum.characters, value: [vm.model.mother ?? ""], background: ColorName.orangeTertiaryColor, navigationStack: vm.$navigationStack))
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "Spouse", value: vm.model.spouse ?? "", background: ColorName.orangePrimaryColor))
            }
            
            Group {
                ClickableRowView(vm: ClickableRowView.ViewModel(title: "Allegiances", type: PageEnum.houses, value: vm.model.allegiances ?? [], background: ColorName.orangeSecondaryColor, navigationStack: vm.$navigationStack))
                ClickableRowView(vm: ClickableRowView.ViewModel(title: "Books", type: PageEnum.books, value: vm.model.books ?? [], background: ColorName.orangeTertiaryColor, navigationStack: vm.$navigationStack))
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "POV in Books", value: vm.model.povBooks?.joined(separator:", ") ?? "", background: ColorName.orangePrimaryColor))
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "In TV series", value: vm.model.tvSeries?.joined(separator:", ") ?? "", background: ColorName.orangeSecondaryColor))
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "Played by", value: vm.model.playedBy?.joined(separator:", ") ?? "", background: ColorName.orangeTertiaryColor))
            }
        }
        .background(vm.theme.color(ColorName.darkGray))
        .cornerRadius(8)
        .padding(20)
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(vm: CharacterView.ViewModel(character: GoTCharacterDto(), navigationStack: .constant(Stack<PageModel>())))
    }
}
