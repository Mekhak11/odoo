//
//  ProjectModel.swift
//  odoo
//
//  Created by Mekhak Ghapantsyan on 5/25/25.
//

import Foundation

struct Project: Hashable, Identifiable, Codable {
  
  var id = UUID()
  let name: String
  var tasks: [Task]
  
}
