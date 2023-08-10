//
//  ContentView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainView(vm: MainView.ViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
