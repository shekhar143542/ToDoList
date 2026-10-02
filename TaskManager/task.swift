import Foundation

struct Task: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var isCompleted: Bool
    var priority: Priority
    var createdAt: Date
}

enum Priority{
    case high
    case low
    case medium
    case None
}
