//
//  MainView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/09.
//

import SwiftUI

struct MainView: View {
    @ObservedObject private(set) var vm: ViewModel
    @State var navigationStack: Stack<PageModel> = Stack<PageModel>(items: [PageModel(title: "FireAndIce")])
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.orange
                    .opacity(0.1)
                    .ignoresSafeArea()
                
                VStack {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 10)
                        .background(LinearGradient(colors: [.yellow, .orange], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                    
                    content
                }
                .navigationTitle(navigationStack.current()!.title ?? "")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(action : {
                    navigationStack.pop()
                }){
                    if (navigationStack.current()!.type != .home) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(Color.black)
                    }
                })
            }
            .background(vm.theme.color(ColorName.lightGray))
        }
    }
    
    var content: some View {
        switch navigationStack.current()!.type {
        case PageEnum.home:
            return AnyView(HomeView(vm: HomeView.ViewModel(navigationStack: $navigationStack)).background(vm.theme.color(ColorName.darkGray)))
        case PageEnum.books:
            return AnyView(BooksView(vm: BooksView.ViewModel(urls: navigationStack.current()!.urls, navigationStack: $navigationStack)).background(vm.theme.color(ColorName.lightGray)))
        case PageEnum.characters:
            return AnyView(CharactersView(vm: CharactersView.ViewModel(urls: navigationStack.current()!.urls, navigationStack: $navigationStack)).background(vm.theme.color(ColorName.lightGray)))
        case PageEnum.houses:
            return AnyView(HousesView(vm: HousesView.ViewModel(urls: navigationStack.current()!.urls, navigationStack: $navigationStack)).background(vm.theme.color(ColorName.lightGray)))
        default:
            return AnyView(HomeView(vm: HomeView.ViewModel(navigationStack: $navigationStack)).background(vm.theme.color(ColorName.lightGray)))
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(vm: MainView.ViewModel())
    }
}
