//
//  TimersListViewModeling.swift
//  odoo
//
//  Created by Mekhak Ghapantsyan on 5/25/25.
//

import Foundation

protocol TimersListViewModeling: ObservableObject {
  
  var timers: [TimerModel] { get set }
  
}
