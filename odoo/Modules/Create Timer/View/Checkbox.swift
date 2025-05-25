//
//  Checkbox.swift
//  odoo
//
//  Created by Mekhak Ghapantsyan on 5/25/25.
//

import SwiftUI

struct Checkbox: View {
  
  let title: String
  @Binding var isChecked: Bool
  
  var body: some View {
    Button {
      isChecked.toggle()
    } label: {
      HStack(spacing: 16) {
        ZStack {
          RoundedRectangle(cornerRadius: 4)
            .stroke(Color.white, lineWidth: 2)
            .frame(width: 24, height: 24)
            .background(isChecked ? Color.white : Color.clear)
            .cornerRadius(4)
          
          if isChecked {
            Image(systemName: "checkmark")
              .font(.system(size: 14, weight: .bold))
              .foregroundStyle(.bakgroundTop)
          }
        }
        
        Text(title)
          .font(AppFont.Light.size14)
          .foregroundStyle(.white)
        Spacer()
      }
    }
    .buttonStyle(PlainButtonStyle())
  }
}
