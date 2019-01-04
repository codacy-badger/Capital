
protocol SettingsServiceProtocol: class {
    var view: SettingsViewControllerProtocol? {get set}
    func viewDidLoad(_ view: SettingsViewControllerProtocol)
    func didSelect(_ row: DataModelRowProtocol, at ix: IndexPath)
}

class SettingsService: ClassService, SettingsServiceProtocol {
    weak var view: SettingsViewControllerProtocol?
    
    func viewDidLoad(_ view: SettingsViewControllerProtocol) {
        self.view = view
        getData()
    }
    
    func getData() {
        view?.table.localData = DataModel(Settings.allCases.map{(id: "\($0.rawValue)", name: $0.name, desc: "")})
    }
    
    func didSelect(_ row: DataModelRowProtocol, at ix: IndexPath) {
        guard let id = row.id, let idInt = Int(id), let settings = Settings(rawValue: idInt) else {return}
        switch settings {
        case .LogOut:
            data.signOut() {error in
                if let error = error {print("Error in loggin out user \(error.localizedDescription)")} else {
                    self.view?.dismissNavigationViewController()
                }
            }
        case .DeleteUser:
            data.deleteUser() {error in
                if let error = error {print("Error in deleting user \(error.localizedDescription)")} else {
                    self.view?.dismissNavigationViewController()
                }
            }
        }
    }
    
    enum Settings: Int, CaseIterable {
        case LogOut, DeleteUser
        var name: String {
            switch self {
            case .LogOut: return "Log Out"
            case .DeleteUser: return "Delete User"
            }
        }
    }
    
}