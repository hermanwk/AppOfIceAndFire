//
//  CollapsableContainerView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/17.
//

import SwiftUI

struct CollapsableContainerView<Content: View>: View {
    var title: String
    var onLabel: String
    var offLabel: String
    @State var displaySection = true
    @State var content: () -> Content
    
    var body: some View {
        List {
          Section(
            header: SectionHeader(
              title: title,
              isOn: $displaySection,
              onLabel: onLabel,
              offLabel: offLabel
            )
          ) {
            if displaySection {
                self.content()
            }
          }
        }
      }
}

struct CollapsableContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CollapsableContainerView(title: "", onLabel: "", offLabel: "", displaySection: true, content: { Text("contentA") })
    }
}
