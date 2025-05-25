//
//  OpenedTaskView.swift
//  odoo
//
//  Created by Mekhak Ghapantsyan on 5/25/25.
//


import SwiftUI

struct OpenedTaskView: View {
  
  enum Tab: String, CaseIterable {
    case timesheets = "Timesheets"
    case details = "Details"
  }
  
  @Environment(\.presentationMode) var presentationMode
  
  @Binding var timerModel: TimerModel
  
  @State var tab: Tab = .timesheets
  @State private var isExpanded = false
  
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      TabSwitcherView(selectedTab: $tab)
      switch self.tab {
      case .timesheets:
        timesheetsTab
      case .details:
        detailsTab
      }
      Spacer()
    }
    .padding()
    .linearGradientBackground()
    .navigationBarTitleDisplayMode(.inline)
    .navigationTitle(Text("Get to know \(timerModel.project.name) - \(timerModel.task.name)"))
  }
  
}

extension OpenedTaskView {
  
  private var timesheetsTab: some View {
    VStack(alignment: .leading, spacing: 16) {
      VStack(alignment: .leading, spacing: 8) {
        weekDay
        deadline
        startTime
        timer
      }
      divider
      description
    }
    .padding()
    .background(.cellSurface)
    .clipShape(RoundedRectangle(cornerRadius: 16))
  }
  
  private var description: some View {
    VStack(alignment: .leading,spacing: 12) {
      Text("Description")
        .font(AppFont.Light.size12)
        .foregroundColor(.white.opacity(0.6))
      
      VStack(alignment: .leading, spacing: 4) {
        Text(timerModel.task.description)
          .font(AppFont.Light.size16)
          .foregroundColor(.white)
          .lineLimit(isExpanded ? nil : 2)
        
        Button(action: { isExpanded.toggle() }) {
          Text(isExpanded ? "Read Less" : "Read More")
            .font(AppFont.Light.size12)
            .foregroundColor(.white)
        }
      }
    }
  }
  
  private var divider: some View {
    Divider()
      .overlay(.containerSecondary)
  }
  
  private var timer: some View {
    HStack {
      Text(timerModel.task.spenatTime.timeHMS())
        .font(AppFont.Bold.size36)
        .bold()
        .foregroundColor(.white)
      Spacer()
      Button {
        timerModel.isInProcess.toggle()
      } label: {
        Image(timerModel.isInProcess ? .cellPause : .cellPlay)
          .frame(width: 36, height: 36)
          .background(timerModel.isInProcess ? .white : .cellSurface)
          .clipShape(Circle())
      }
    }
    .padding(.top, 4)
  }
  
  private var startTime: some View {
    Text("Start Time \(timerModel.creationDate.timeOnly)")
      .font(AppFont.Light.size12)
      .foregroundColor(.white.opacity(0.6))
  }
  
  private var weekDay: some View {
    Text(timerModel.creationDate.weekdayName())
      .font(AppFont.Light.size12)
      .foregroundColor(.white)
  }
  
  
  private var deadline: some View {
    Text(timerModel.task.startDate.formattedDate())
      .font(AppFont.Bold.size16)
      .foregroundColor(.white)
  }
  
}

extension OpenedTaskView {
  
  private var detailsTab: some View {
    VStack(spacing: 8) {
      taskInfo
      detailedDescription
    }
  }
  
  private var taskInfo: some View {
    VStack(alignment: .leading,spacing: 16) {
      projectName
      taskDeadline
      assigned
    }
    .padding()
    .background(.cellSurface)
    .clipShape(RoundedRectangle(cornerRadius: 16))
  }
  
  private var projectName: some View {
    VStack(alignment: .leading) {
      Text("Project")
        .foregroundStyle(.white)
        .font(AppFont.Light.size12)
      HStack(spacing: 8) {
        RoundedRectangle(cornerRadius: 4)
          .foregroundStyle(.cellYellow)
          .frame(width: 2, height: 24)
        Text(timerModel.project.name)
          .font(AppFont.Bold.size16)
          .foregroundStyle(.white)
        Spacer()
      }
    }
    
  }
  
  private var taskDeadline: some View {
    VStack(alignment: .leading,spacing: 4) {
      Text("Deadline")
        .font(AppFont.Light.size12)
        .foregroundStyle(.white)
      Text(timerModel.task.deadline.formattedDateSlashes())
        .font(AppFont.Bold.size16)
        .foregroundStyle(.white)
    }
  }
  
  private var assigned: some View {
    VStack(alignment: .leading,spacing: 4) {
      Text("Assigned to")
        .font(AppFont.Light.size12)
        .foregroundStyle(.white)
      Text(timerModel.task.assignedTo)
        .font(AppFont.Bold.size16)
        .foregroundStyle(.white)
    }
  }
  
  private var detailedDescription: some View {
    VStack(alignment: .leading, spacing: 4) {
      HStack {
        Text("Description")
          .font(AppFont.Light.size14)
          .foregroundStyle(.white)
        Spacer()
      }
      Text(timerModel.task.description)
        .font(AppFont.Light.size12)
        .foregroundStyle(.white)
        .lineLimit(nil)
        .foregroundStyle(.white)
    }
    .padding()
    .background(.cellSurface)
    .clipShape(RoundedRectangle(cornerRadius: 16))
  }
  
}
