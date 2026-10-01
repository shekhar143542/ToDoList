
import SwiftUI

struct AddTaskView: View {
    
    @Binding var tasks: [Task]
    
    @State private var title = ""
    @State private var description = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            
            TextField("Task title", text: $title)
                .textFieldStyle(.roundedBorder)
            
            TextField("Description", text: $description)
                .textFieldStyle(.roundedBorder)
            
            Button("Save") {
                
                let newTask = Task(
                    title: title,
                    description: description
                )
                
                tasks.append(newTask)
                
                dismiss()
            }
        }
        .padding()
        .navigationTitle("Add Task")
    }
}

