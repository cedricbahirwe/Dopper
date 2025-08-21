struct AlertAction {
    let title: String
    let handler: () -> Void
}
protocol AppAlert: Identifiable {
    var title: String { get }
    var message: String { get }
    var actions: [AlertAction]? { get }
}