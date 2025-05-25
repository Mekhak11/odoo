//
//  TimersListView.swift
//  odoo
//
//  Created by Mekhak Ghapantsyan on 5/25/25.
//

import SwiftUI

struct TimersListView<M: TimersListViewModeling>: View {
  
  @ObservedObject var viewmodel: M
  
  var body: some View {
    NavigationStack {
      ZStack {
        if viewmodel.timers.isEmpty {
          emptyState
        } else {
          list
        }
      }
      .linearGradientBackground()
      .toolbar {
        ToolbarItemGroup(placement: .topBarTrailing) {
          NavigationLink(destination: CreateTimerView(viewModel: CreateTimerViewModel(), complition: { timer in
            viewmodel.timers.append(timer)
          })) {
            Image(.navbarPlus)
              .padding(12)
              .background(.containerSecondary)
              .clipShape(RoundedRectangle(cornerRadius: 12))
          }
          .padding()
          
        }
        ToolbarItemGroup(placement: .topBarLeading) {
          Text("Timesheets")
            .font(AppFont.ExtraBold.size32)
            .fontWeight(.bold)
            .foregroundColor(.white)
        }
      }
    }
    .tint(.white)
  }
  
}

extension TimersListView {
  private var list: some View {
    VStack(spacing: 8) {
      ScrollView {
        ForEach($viewmodel.timers, id: \.id) { timer in
          NavigationLink(
            destination:
              OpenedTaskView(timerModel: timer),
            label: {
              TimerCell(
                timerModel: timer
              )
            }
          )
        }
      }
    }
    .padding(16)
  }
  
  private var emptyState: some View {
    VStack {
      Spacer()
      HStack {
        Spacer()
        VStack {
          Image(.stateEmpty)
          Text("You don’t have any timesheets")
            .font(AppFont.ExtraBold.size24)
            .foregroundStyle(.white)
        }
        Spacer()
      }
      Spacer()
    }
  }
  
}

#Preview {
  TimersListView(viewmodel: TimersListViewModel())
}
