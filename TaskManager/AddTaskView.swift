import SwiftUI
import PhotosUI
import UIKit

struct AddTaskView: View {
    
    @Binding var tasks: [Task]
    
    @State private var title = ""
    @State private var description = ""
    @State private var priority: Priority = .None
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var imageData: Data?
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            TextField("Task title", text: $title)
                .textFieldStyle(.roundedBorder)
            
            TextField("Description", text: $description)
                .textFieldStyle(.roundedBorder)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Priority")
                    .font(.headline)
                
                Picker("Priority", selection: $priority) {
                    Text("Low").tag(Priority.low)
                    Text("Medium").tag(Priority.medium)
                    Text("High").tag(Priority.high)
                    Text("None").tag(Priority.None)
                }
                .pickerStyle(.menu)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            PhotosPicker(
                selection: $selectedPhoto,
                matching: .images
            ) {
                Label("Choose Image", systemImage: "photo")
            }
            .onChange(of: selectedPhoto) {
                Swift.Task {
                    if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                        imageData = data
                    }
                }
            }
            
            if let imageData = imageData,
               let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            Button(action: {
                let newTask = Task(
                    title: title,
                    description: description,
                    isCompleted: false,
                    priority: priority,
                    createdAt: Date(),
                    imageData: imageData
                )
                
                tasks.append(newTask)
                dismiss()
            }) {
                Text("Save")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Add Task")
    }
}
