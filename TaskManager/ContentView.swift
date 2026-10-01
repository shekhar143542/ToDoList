
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            
            List {
                Text("Learn Swift")
                Text("Build Todo App")
                Text("Practice DSA")
            }
            .navigationTitle("My Tasks")
        }
    }
}

#Preview {
    ContentView()
}
