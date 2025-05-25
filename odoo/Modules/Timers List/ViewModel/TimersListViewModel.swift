//
//  TimersListViewModel.swift
//  odoo
//
//  Created by Mekhak Ghapantsyan on 5/25/25.
//

import Foundation

final class TimersListViewModel: TimersListViewModeling {
  
  @Published var timers: [TimerModel] = []
  
}

