//
//  TimerCell.swift
//  odoo
//
//  Created by Mekhak Ghapantsyan on 5/25/25.
//

import SwiftUI

struct TimerCell: View {
  
  @Binding var timerModel: TimerModel
  private let timerPublisher = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  
  var body: some View {
    content
      .onReceive(timerPublisher) { _ in
        if timerModel.isInProcess {
          timerModel.task.spenatTime += 1
        }
      }
  }
  
}

extension TimerCell {
  
  private var content: some View {
    HStack(spacing: 12) {
      divider
      VStack(alignment: .leading,spacing: 8) {
        assignment
        project
        deadline
      }
      Spacer()
      timer
    }
    .padding(16)
    .background(.cellSurface)
    .cornerRadius(16)
  }
  
  private var divider: some View {
    RoundedRectangle(cornerRadius: 8)
      .fill(.cellYellow)
      .frame(width: 2)
  }
  
  private var assignment: some View {
    HStack(spacing: 8) {
      Image(timerModel.isFavorite ? .cellStared : .cellNotStared)
      Text(timerModel.task.name)
        .font(AppFont.Bold.size16)
        .foregroundStyle(.cellWhite)
        .multilineTextAlignment(.leading)
    }
  }
  
  private var deadline: some View {
    HStack(spacing: 8) {
      Image(.cellDeadline)
      Text(timerModel.task.deadline.formattedDate())
        .font(AppFont.Medium.size14)
        .foregroundStyle(.cellWhite)
    }
  }
  
  private var project: some View {
    HStack(spacing: 8) {
      Image(.cellProject)
      Text(timerModel.project.name)
        .font(AppFont.Medium.size14)
        .foregroundStyle(.cellWhite)
    }
  }
  
  private var timer: some View {
    HStack(spacing: 6) {
      Text(timerModel.task.spenatTime.timeMS())
        .font(AppFont.Regular.size14)
        .foregroundStyle(timerModel.isInProcess ?.black : .white  )
      Button {
        timerModel.isInProcess.toggle()
      } label: {
        Image(timerModel.isInProcess ? .cellPause : .cellPlay)
      }
    }
    .padding(.vertical,8)
    .padding(.horizontal,16)
    .background(timerModel.isInProcess ? .cellWhite : .containerSecondary )
    .clipShape(RoundedRectangle(cornerRadius: 64))
  }
  
}

#Preview {
  TimerCell(
    timerModel: .constant(
      TimerModel(
        task: Task(
          name: "Task",
          description: "Description",
          spenatTime: 10,
          deadline: Date(),
          startDate: Date(),
          assignedTo: "Ivan"
        ),
        project: Project(
          name: "iOS App",
          tasks: []
        ),
        isInProcess: false,
        isFavorite: false
      )
    )
  )
}
