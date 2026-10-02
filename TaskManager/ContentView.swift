import SwiftUI

struct ContentView: View {
    
    @State private var tasks = [
        Task(
            title: "Learn Swift",
            description: "Learn SwiftUI basics",
            isCompleted: false,
            priority: .low
        ),
        Task(
            title: "Build Todo App",
            description: "Build the first version",
            isCompleted: false,
            priority: .medium
        )
    ]
    
    private func sortTasks() {
        tasks.sort {
            if $0.priority == .high {
                return true
            }

            if $1.priority == .high {
                return false
            }

            if $0.priority == .medium {
                return true
            }

            return false
        }
    }
    
    var body: some View {
        
        NavigationStack {
            Group {
                if tasks.isEmpty {
                    VStack(spacing: 15) {
                        Image(systemName: "checklist")
                            .font(.system(size: 60))
                            .foregroundStyle(.gray)

                        Text("No Tasks Yet")
                            .font(.title2)
                            .fontWeight(.semibold)

                        Text("Add your first task to get started.")
                            .foregroundStyle(.gray)
                    }
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity
                    )
                } else {
                    List {
                        ForEach(tasks.indices, id: \.self) { index in
                            HStack {
                                Button {
                                    tasks[index].isCompleted.toggle()
                                } label: {
                                    Image(
                                        systemName: tasks[index].isCompleted ?
                                        "checkmark.circle.fill" : "circle"
                                    )
                                }
                                .buttonStyle(.plain)

                                VStack(alignment: .leading) {
                                    Text(tasks[index].title)
                                        .font(.headline)

                                    Text(tasks[index].description)
                                        .font(.subheadline)
                            Text(tasks[index].isCompleted
                                 ? "Completed":"Pending")
                                    .font(.caption)
                                    .foregroundStyle(
                                        tasks[index].isCompleted
                                        ? .green
                                        : .red
                                    )
                                }
                                Spacer()
                                
                                Text(tasks[index].priority == .high ?"High":tasks[index].priority == .medium ? "Medium" : "Low"
                                )
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundStyle(
                                    tasks[index].priority == .high
                                        ? .red
                                        : tasks[index].priority == .medium
                                            ? .yellow
                                            : .green
                                )
                            }
                        }
                        .onDelete { indexSet in
                            tasks.remove(atOffsets: indexSet)
                        }
                    }
                }
            }
            .navigationTitle("My Tasks")
            .toolbar {
                NavigationLink("Add") {
                    AddTaskView(tasks: $tasks)
                }
            }
            .onAppear {
                sortTasks()
            }
        }
    }
}

#Preview {
    ContentView()
}
