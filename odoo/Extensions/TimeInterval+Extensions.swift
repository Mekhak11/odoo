//
//  TimeInterval+Extensions.swift
//  odoo
//
//  Created by Mekhak Ghapantsyan on 5/25/25.
//

import Foundation

extension TimeInterval {
  
  func timeHMS() -> String {
    let hours = Int(self) / 3600
    let minutes = (Int(self) % 3600) / 60
    let seconds = Int(self) % 60
    
    return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
  }
  
  func timeMS() -> String {
    let hours = Int(self) / 3600
    let minutes = (Int(self) % 3600) / 60
    let seconds = Int(self) % 60
    if hours == 0 {
      return String(format: "%02d:%02d", minutes, seconds)
    }
    return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
  }
  
}
