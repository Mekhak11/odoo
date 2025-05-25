//
//  TimerModel.swift
//  odoo
//
//  Created by Mekhak Ghapantsyan on 5/25/25.
//

import Foundation

struct TimerModel: Codable {
  
  var id: UUID = UUID()
  var task: Task
  var project: Project
  var isInProcess: Bool
  var isFavorite: Bool
  var creationDate: Date = Date()
  
}
