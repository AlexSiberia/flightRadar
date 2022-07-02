import Foundation

protocol ResultOfSearchByFlightNumberViewInput: AnyObject {
    
    func showLoadingState()
    func showDataState(_ data: ResultOfSearchByFlightNumberViewData)
}
