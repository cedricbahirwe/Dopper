protocol AppAlert: Identifiable {
    var title: String { get }
    var message: String { get }
    var actions: [AlertAction]? { get }
}
