import UIKit
import EasyAutolayout

protocol MainViewProtocol: AnyObject {
    func updateLabel(text: String)
    func builderSecondModule()
}

final class MainViewController: UIViewController {
    // MARK: Public
    var presenter: MainViewPresenterProtocol!
    
    // MARK: Private
    private let counterLabel = UILabel()
    private let incrementButton = UIButton()
    private let decrementButton = UIButton()
    private let resetButton = UIButton()
    private let showSecondViewButton = UIButton()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubwiews()
        setupConstraints()
        configureUI()
        setupBehavior()
    }
    // MARK: - API
    // MARK: - Setups
    private func setupSubwiews() {
        [counterLabel, incrementButton, decrementButton, resetButton, showSecondViewButton].forEach { view.addSubview($0) }
    }
    private func setupConstraints() {
        counterLabel.pin
            .width(to: 100).height(to: 100)
            .top(to: view, offset: 150)
            .centerX(in: view)
        incrementButton.pin
            .width(to: 150).height(to: 40)
            .below(of: counterLabel, offset: 40)
            .centerX(in: view)
        decrementButton.pin
            .width(to: 150).height(to: 40)
            .below(of: incrementButton, offset: 20)
            .centerX(in: view)
        resetButton.pin
            .width(to: 150).height(to: 40)
            .below(of: decrementButton, offset: 40)
            .centerX(in: view)
        showSecondViewButton.pin
            .width(to: 150).height(to: 40)
            .below(of: resetButton, offset: 50)
            .centerX(in: view)
    }
    private func configureUI() {
        view.backgroundColor = .black
        
        counterLabel.backgroundColor = .white
        counterLabel.font = UIFont.systemFont(ofSize: 26)
        counterLabel.clipsToBounds = true
        counterLabel.layer.cornerRadius = 25
        counterLabel.textAlignment = .center
        
        incrementButton.backgroundColor = .systemOrange
        incrementButton.layer.cornerRadius = 10
        incrementButton.setTitle("increment", for: .normal)
        
        decrementButton.backgroundColor = .systemOrange
        decrementButton.layer.cornerRadius = 10
        decrementButton.setTitle("decrement", for: .normal)
        
        resetButton.backgroundColor = .systemBlue
        resetButton.layer.cornerRadius = 10
        resetButton.setTitle("reset", for: .normal)
        
        showSecondViewButton.backgroundColor = .systemBlue
        showSecondViewButton.layer.cornerRadius = 10
        showSecondViewButton.setTitle("next view", for: .normal)
    }
    private func setupBehavior() {
        presenter.resetCounter()
        incrementButton.addTarget(self, action: #selector(incrementButtonDidTapped), for: .touchUpInside)
        decrementButton.addTarget(self, action: #selector(decrementButtonDidTapped), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetButtonDidTapped), for: .touchUpInside)
        showSecondViewButton.addTarget(self, action: #selector(showSecondViewButtonDidTapped), for: .touchUpInside)
    }
    // MARK: - Helpers
    @objc private func incrementButtonDidTapped() {
        presenter.incrementCounter()
    }
    @objc private func decrementButtonDidTapped() {
        presenter.decrementCounter()
    }
    @objc private func resetButtonDidTapped() {
        presenter.resetCounter()
    }
    @objc private func showSecondViewButtonDidTapped() {
        presenter.showSecondVC()
    }
}

// MARK: - Extensions
extension MainViewController: MainViewProtocol {
    func updateLabel(text: String) {
        counterLabel.text = text
    }
    func builderSecondModule() {
    let secondView = SecondViewController()
    let presenter =  SecondViewPresenter(view: secondView)
        secondView.presenter = presenter
    navigationController?.pushViewController(secondView, animated: true)
    }
}
