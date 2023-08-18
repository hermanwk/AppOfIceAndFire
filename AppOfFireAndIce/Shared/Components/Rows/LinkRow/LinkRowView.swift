////
////  LinkRowView.swift
////  AppOfFireAndIce
////
////  Created by Herman Willem Keuris on 2023/08/17.
////
//
//import SwiftUI
//
//struct LinkRowView: View {
//    var title: String
//    var navLink: any View
//    
//    var body: some View {
//        if !currentLord.isEmpty {
//            HStack {
//                Text("\(title):")
//                Spacer()
//                NavigationLink {
//                    CharacterDetailsView(vm: CharacterDetailsView.ViewModel(title: text, url: currentLord))
//                } label: {
//                    HStack {
//                        Text("Show more")
//                        Image(systemName: "rectangle.portrait.and.arrow.forward")
//                            .resizable()
//                            .foregroundColor(Color.black)
//                            .frame(width: 14, height: 14)
//                    }
//                }
//            }.accentColor(Color.blue)
//        }
//    }
//}
//
//struct LinkRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        LinkRowView(title: "", text: "")
//    }
//}
