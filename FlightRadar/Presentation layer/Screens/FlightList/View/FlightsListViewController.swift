import UIKit

protocol FlightsListViewProtocol: AnyObject {
    func update(_ data: State)
}

// V = View
class FlightsListViewController: UIViewController, FlightsListViewProtocol {
    
    private let presenter: FlightsListPresenterProtocol
    private let layoutManager
    private let animator:
    
    init(presenter: FlightsListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.didLoadView()
        layoutManager.layout
    }
    
    func update(_ data: state) {
        self.data = data
        tableView.dataSource = DataSource.make(_ self.data )
        tableView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
