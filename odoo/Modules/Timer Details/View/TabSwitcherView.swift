//
//  TabSwitcherView.swift
//  odoo
//
//  Created by Mekhak Ghapantsyan on 5/25/25.
//

import SwiftUI

struct TabSwitcherView<Tab: Hashable & CaseIterable & RawRepresentable>: View where Tab.RawValue == String {
  
  @Binding var selectedTab: Tab
  
  var body: some View {
    ZStack(alignment: .bottom) {
      HStack(spacing: 40) {
        Spacer()
        ForEach(Array(Tab.allCases), id: \.self) { tab in
          VStack(spacing: 4) {
            Button {
              withAnimation {
                selectedTab = tab
              }
            } label: {
              Text(tab.rawValue)
                .foregroundColor(.white)
                .font(AppFont.Medium.size16)
            }
            
            Rectangle()
              .fill(Color.white)
              .frame(height: 2)
              .opacity(selectedTab == tab ? 1 : 0)
              .padding(.horizontal)
          }
        }
        Spacer()
      }
      .padding(.top, 8)
      Divider()
        .overlay(.containerSecondary)
    }
  }
  
}
