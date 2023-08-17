//
//  ThreeStateToggleView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/16.
//

import SwiftUI

struct ThreeStateToggleView: View {
    @ObservedObject private(set) var vm: ViewModel

    var body: some View {
        VStack {
            Text(vm.label)
            Picker("", selection: $vm.value) {
                Text("N/A").tag(0)
                Text(vm.firstOption).tag(1)
                Text(vm.secondOption).tag(2)
            }
            .pickerStyle(.segmented)
        }
    }
}

struct ThreeStateToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeStateToggleView(vm: ThreeStateToggleView.ViewModel(label: "", value: .constant(0)))
    }
}
