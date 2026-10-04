import SwiftUI
import UIKit

struct TaskDetailView: View {
    let task: Task
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                if let imageData = task.imageData,
                   let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(12)
                }
                
                HStack {
                    Text(task.title)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text(
                        task.priority == .high ? "High" :
                        task.priority == .medium ? "Medium" :
                        task.priority == .low ? "Low" : "None"
                    )
                    .font(.caption)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(
                        task.priority == .high ? Color.red.opacity(0.2) :
                        task.priority == .medium ? Color.yellow.opacity(0.2) :
                        task.priority == .low ? Color.green.opacity(0.2) : Color.gray.opacity(0.2)
                    )
                    .foregroundStyle(
                        task.priority == .high ? .red :
                        task.priority == .medium ? .orange :
                        task.priority == .low ? .green : .gray
                    )
                    .clipShape(Capsule())
                }
                
                HStack {
                    Label(
                        task.isCompleted ? "Completed" : "Pending",
                        systemImage: task.isCompleted ? "checkmark.circle.fill" : "clock.fill"
                    )
                    .font(.subheadline)
                    .foregroundStyle(task.isCompleted ? .green : .orange)
                    
                    Spacer()
                    
                    Text(task.createdAt.formatted(date: .long, time: .shortened))
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Description")
                        .font(.headline)
                        .foregroundStyle(.gray)
                    
                    Text(task.description.isEmpty ? "No description provided." : task.description)
                        .font(.body)
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Task Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
