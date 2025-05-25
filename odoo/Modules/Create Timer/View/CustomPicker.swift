//
//  CustomPicker.swift
//  odoo
//
//  Created by Mekhak Ghapantsyan on 5/25/25.
//

import SwiftUI

struct CustomPicker<T: Identifiable & Hashable>: View {
  
  let title: String
  let options: [T]
  @Binding var selected: T?
  let labelKeyPath: KeyPath<T, String>
  
  @State private var isExpanded: Bool = false
  
  var body: some View {
    VStack(spacing: 4) {
      Button(action: {
        withAnimation {
          isExpanded.toggle()
        }
      }) {
        HStack {
          Text(selected?[keyPath: labelKeyPath] ?? title)
            .font(AppFont.Light.size16)
            .foregroundStyle(.white)
          Spacer()
          Image(systemName: "chevron.down")
            .rotationEffect(.degrees(isExpanded ? 180 : 0))
            .foregroundColor(.white)
        }
        .background(Color.clear)
        .padding()
        .overlay(
          RoundedRectangle(cornerRadius: 8)
            .stroke(.containerSecondary, lineWidth: 1)
        )
      }
      
      if isExpanded {
        VStack(spacing: 0) {
          ForEach(options) { option in
            Button(action: {
              withAnimation {
                selected = option
                isExpanded = false
              }
            }) {
              HStack {
                Text(option[keyPath: labelKeyPath])
                  .font(AppFont.Light.size16)
                  .foregroundColor(.white)
                Spacer()
              }
              .padding()
              .background(Color.white.opacity(0.05))
            }
            Divider()
              .overlay(.containerSecondary)
          }
        }
        .background(Color.clear)
        .clipShape(RoundedRectangle(cornerRadius: 8))
      }
    }
  }
  
}
