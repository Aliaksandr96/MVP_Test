import UIKit
import EasyAutolayout

protocol SecondViewProtocol: AnyObject {
    func setTextInTFfromLabel(text: String)
}

class SecondViewController: UIViewController {
    // MARK: - Properties
    
    // MARK: Public
    var presenter: SecondViewPresenterProtocol!
    
    // MARK: Private
    private let nameLabel = UILabel()
    private let nameTextField = UITextField()
    private let saveNameButton = UIButton()
    
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
        [nameLabel, nameTextField, saveNameButton].forEach { view.addSubview($0) }
    }
    private func setupConstraints() {
        nameLabel.pin
            .width(to: 250).height(to: 40)
            .top(to: view, offset: 150)
            .centerX(in: view)
        nameTextField.pin
            .width(to: 170).height(to: 40)
            .below(of: nameLabel, offset: 40)
            .centerX(in: view)
        saveNameButton.pin
            .width(to: 150).height(to: 40)
            .below(of: nameTextField, offset: 20)
            .centerX(in: view)
    }
    private func configureUI() {
        view.backgroundColor = .black
        
        nameLabel.backgroundColor = .lightGray
        nameLabel.font = UIFont.systemFont(ofSize: 26)
        nameLabel.clipsToBounds = true
        nameLabel.layer.cornerRadius = 10
        nameLabel.textAlignment = .center
        
        nameTextField.backgroundColor = .white
        nameTextField.layer.cornerRadius = 10
        nameTextField.textAlignment = .center
        nameTextField.placeholder = "Write name"
        nameTextField.font = UIFont.systemFont(ofSize: 20)
        
        saveNameButton.backgroundColor = .systemBlue
        saveNameButton.layer.cornerRadius = 10
        saveNameButton.setTitle("save", for: .normal)
    }
    private func setupBehavior() {
        saveNameButton.addTarget(self, action: #selector(saveNameButtonDidTapped), for: .touchUpInside)
    }
    // MARK: - Helpers
    @objc private func saveNameButtonDidTapped() {
        presenter.setText()
    }
}

// MARK: - Extensions
extension SecondViewController: SecondViewProtocol {
    func setTextInTFfromLabel(text: String) {
        nameLabel.text = nameTextField.text
    }
}
