//
//  Date+Extensions.swift
//  odoo
//
//  Created by Mekhak Ghapantsyan on 5/25/25.
//

import Foundation

extension Date {
  
  func formattedDate() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd.MM.yyyy"
    return formatter.string(from: self)
  }
  
  func formattedDateSlashes() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    return formatter.string(from: self)
  }
  
  func weekdayName() -> String {
    let formatter = DateFormatter()
    formatter.locale = Locale.current
    formatter.dateFormat = "EEEE"
    return formatter.string(from: self)
  }
  
  var timeOnly: String {
      let formatter = DateFormatter()
      formatter.locale = Locale.current
      formatter.dateFormat = "HH:mm"
      return formatter.string(from: self)
  }
  
}
