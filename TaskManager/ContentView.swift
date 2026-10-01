import SwiftUI

struct ContentView: View {
    
    @State private var tasks = [
        Task(
            title: "Learn Swift",
            description: "Learn SwiftUI basics"
        ),
        Task(
            title: "Build Todo App",
            description: "Build the first version"
        )
    ]
    
    var body: some View {
        NavigationStack {
            
//            List {
//                ForEach(tasks) { task in
//
//                    VStack(alignment: .leading) {
//                        Text(task.title)
//                            .font(.headline)
//
//                        Text(task.description)
//                            .font(.subheadline)
//                    }
//                }
//                .onDelete { indexSet in
//                    tasks.remove(atOffsets: indexSet)
//                }
//            }
            
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

             ForEach(tasks) { task in

          VStack(alignment: .leading) {

           Text(task.title)
            .font(.headline)

              Text(task.description)
              .font(.subheadline)
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
}
            .navigationTitle("My Tasks")
            .toolbar {
                NavigationLink("Add") {
                    AddTaskView(tasks: $tasks)
                }
            }
        }
    }


#Preview {
    ContentView()
}
