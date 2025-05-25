//
//  View+Extension.swift
//  odoo
//
//  Created by Mekhak Ghapantsyan on 5/25/25.
//

import SwiftUI

struct LinearGradientBackground: ViewModifier {
  
  var colors: [Color]
  var startPoint: UnitPoint
  var endPoint: UnitPoint
  
  func body(content: Content) -> some View {
    content
      .background(
        LinearGradient(
          gradient: Gradient(colors: colors),
          startPoint: startPoint,
          endPoint: endPoint
        )
      )
  }
  
}

extension View {
  
  func linearGradientBackground(
    colors: [Color] = [.bakgroundTop, .backgroundBottom],
    startPoint: UnitPoint = .top,
    endPoint: UnitPoint = .bottom
  ) -> some View {
    self.modifier(
      LinearGradientBackground(
        colors: colors,
        startPoint: startPoint,
        endPoint: endPoint
      )
    )
  }
  
}

