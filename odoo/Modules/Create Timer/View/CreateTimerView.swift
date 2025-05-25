//
//  CreateTimerView.swift
//  odoo
//
//  Created by Mekhak Ghapantsyan on 5/25/25.
//

import SwiftUI

struct CreateTimerView<M: CreateTimerViewModeling>: View {
  
  @ObservedObject var viewModel: M
  @Environment(\.presentationMode) var presentationMode
  
  @State var selectedProject: Project?
  @State var selectedTask: Task?
  @State var description: String = ""
  @State var isFavorite: Bool = false
  var complition: (TimerModel) -> ()
  
  var body: some View {
    content
      .linearGradientBackground()
      .navigationBarTitleDisplayMode(.inline)
      .navigationTitle(
        Text("Create Timer")
      )
  }
  
}

extension CreateTimerView {
  
  private var content: some View {
    VStack {
      ScrollView {
        VStack(spacing: 28) {
          projectPicker
          taskPicker
          descriptionField
          Checkbox(title: "Make Favorite", isChecked: $isFavorite)
        }
      }
      createButton
    }
    .padding(16)
    .onChange(of: selectedProject) {
      selectedTask = nil
    }
    .onChange(of: selectedTask) {
      description = selectedTask?.description ?? ""
    }
  }
  
  private var projectPicker: some View {
    CustomPicker(
      title: "Project",
      options: viewModel.projects,
      selected: $selectedProject,
      labelKeyPath: \.name
    )
  }
  
  private var taskPicker: some View {
    CustomPicker(
      title: "Task",
      options: selectedProject.map(\.tasks) ?? [],
      selected: $selectedTask,
      labelKeyPath: \.name
    )
  }
  
  
  private var descriptionField: some View {
    TextField(
      "",
      text: $description,
      prompt:
        Text("Description")
        .foregroundStyle(.white)
        .font(AppFont.Light.size16)
    )
    .padding()
    .font(AppFont.Light.size16)
    .background(Color.clear)
    .foregroundColor(.white)
    .overlay {
      RoundedRectangle(cornerRadius: 8)
        .stroke(.containerSecondary, lineWidth: 2)
    }
  }
  
  private var createButton: some View {
    Button {
      guard let selectedTask, let selectedProject else { return }
      
      let timerModel = TimerModel(
        task: selectedTask,
        project: selectedProject,
        isInProcess: false,
        isFavorite: isFavorite
      )
      complition(timerModel)
      presentationMode.wrappedValue.dismiss()
    } label: {
      Text("Create Timer")
        .frame(maxWidth: .infinity)
        .padding()
        .font(AppFont.Medium.size14)
        .background(.containerSecondary)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    .padding(.bottom, 20)
    .disabled(selectedTask == nil || selectedProject == nil)
  }
  
}

#Preview {
  CreateTimerView(
    viewModel: CreateTimerViewModel(),
    complition:   { _ in
      
    })
}
