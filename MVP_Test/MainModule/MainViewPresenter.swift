protocol MainViewPresenterProtocol {
    var counter: Int { get }
    func incrementCounter()
    func decrementCounter()
    func resetCounter()
    func showSecondVC()
}

final class MainViewPresenter: MainViewPresenterProtocol {
    // MARK: - Properties
    
    // MARK: Public
    unowned var view: MainViewController
    
    var counter: Int = 0
    // MARK: Private
    
    // MARK: - Lifecycle
    init(view: MainViewController) {
        self.view = view
    }
    // MARK: - API
    func incrementCounter() {
        counter += 1
        view.updateLabel(text: "\(counter)")
    }
    
    func decrementCounter() {
        counter -= 1
        view.updateLabel(text: "\(counter)")
    }
    func resetCounter() {
        counter = 0
        view.updateLabel(text: "\(counter)")
    }
    func showSecondVC() {
        view.builderSecondModule()
    }
}
