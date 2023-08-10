//
//  HomeView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/09.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private(set) var vm: ViewModel
    
    var body: some View {
        return VStack() {
            ScrollView {
                VStack(alignment: .center) {
                    
                    Spacer()
                        .padding()
                    
                    Button("Books") {
                        vm.navigate(page: PageEnum.books)
                    }
                    .foregroundColor(Color.black)
                    .font(Font.custom(vm.theme.font(FontName.robotoRegular),
                                      size: vm.theme.fontSize(FontSizeName.fontSizeXXLarge)))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .background(vm.theme.color(ColorName.orangePrimaryColor))
                    .cornerRadius(8)
                    
                    Spacer().padding(.bottom, 20)
                    
                    Button("Characters") {
                        vm.navigate(page: PageEnum.characters)
                    }
                    .foregroundColor(Color.black)
                    .font(Font.custom(vm.theme.font(FontName.robotoRegular),
                                      size: vm.theme.fontSize(FontSizeName.fontSizeXXLarge)))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .background(vm.theme.color(ColorName.orangeSecondaryColor))
                    .cornerRadius(8)
                    
                    Spacer().padding(.bottom, 20)
                    
                    Button("Houses") {
                        vm.navigate(page: PageEnum.houses)
                    }
                    .foregroundColor(Color.black)
                    .font(Font.custom(vm.theme.font(FontName.robotoRegular),
                                      size: vm.theme.fontSize(FontSizeName.fontSizeXXLarge)))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .background(vm.theme.color(ColorName.orangeTertiaryColor))
                    .cornerRadius(8)
                }.padding([.leading, .trailing], 50)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(vm: HomeView.ViewModel(navigationStack: .constant(Stack<PageModel>())))
    }
}
