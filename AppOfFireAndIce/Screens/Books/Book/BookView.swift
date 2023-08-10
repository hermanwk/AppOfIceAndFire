//
//  BookView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/10.
//

import SwiftUI

struct BookView: View {
    private(set) var vm: ViewModel
    
    var body: some View {
        VStack {
            Group {
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "Name", value: vm.model.name ?? "", background: ColorName.orangePrimaryColor))
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "ISBN", value: vm.model.isbn ?? "", background: ColorName.orangeSecondaryColor))
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "Authors", value: vm.model.authors?.joined(separator:", ") ?? "", background: ColorName.orangeTertiaryColor))
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "Number of page", value: vm.model.numberOfPages?.description ?? "", background: ColorName.orangePrimaryColor))
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "Publisher", value: vm.model.publisher ?? "", background: ColorName.orangeSecondaryColor))
            }
            
            Group {
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "Country", value: vm.model.country ?? "", background: ColorName.orangeTertiaryColor))
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "Media type", value: vm.model.mediaType ?? "", background: ColorName.orangePrimaryColor))
                ReadOnlyRowView(vm: ReadOnlyRowView.ViewModel(title: "Released", value: vm.model.released ?? "", background: ColorName.orangeSecondaryColor))
                ClickableRowView(vm: ClickableRowView.ViewModel(title: "Characters", type: PageEnum.characters, value: vm.model.characters ?? [], background: ColorName.orangeTertiaryColor, navigationStack: vm.$navigationStack))
                ClickableRowView(vm: ClickableRowView.ViewModel(title: "POV Character", type: PageEnum.characters, value: vm.model.povCharacters ?? [], background: ColorName.orangePrimaryColor, navigationStack: vm.$navigationStack))
            }
        }
        .background(vm.theme.color(ColorName.darkGray))
        .cornerRadius(8)
        .padding(20)
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(vm: BookView.ViewModel(book: GoTBookDto(), navigationStack: .constant(Stack<PageModel>())))
    }
}
