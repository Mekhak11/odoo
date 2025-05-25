//
//  TaskModel.swift
//  odoo
//
//  Created by Mekhak Ghapantsyan on 5/25/25.
//

import Foundation

struct Task: Hashable, Identifiable, Codable {
  
  var id = UUID()
  let name: String
  let description: String
  var spenatTime: TimeInterval
  var isPlaying: Bool = false
  var deadline: Date
  var startDate: Date
  var assignedTo: String
  
}
