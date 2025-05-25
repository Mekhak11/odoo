//
//  CreateTimerViewModeling.swift
//  odoo
//
//  Created by Mekhak Ghapantsyan on 5/25/25.
//

import Foundation

protocol CreateTimerViewModeling: ObservableObject {
  
  var projects: [Project] { get set }

}
