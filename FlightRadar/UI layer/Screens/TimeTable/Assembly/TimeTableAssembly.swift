import Foundation

class TimeTableAssembly {
    
    func create() -> AirportTimeTableViewController {
        let presenter = TimeTablePresenter()
        let view = AirportTimeTableViewController()
        
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
}
