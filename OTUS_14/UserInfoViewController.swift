import UIKit

final class UserInfoViewController: UIViewController {
    
    // MARK: - UI Elements
    private lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 15
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var userPhoto: UIImageView = {
        let element = UIImageView()
        element.backgroundColor = .lightGray
        element.tintColor = .darkGray
        element.image = UIImage(systemName: "person.fill")
        element.contentMode = .scaleAspectFill
        element.layer.masksToBounds = true
        element.layer.cornerRadius = 45
        element.layer.borderWidth = 2
        element.layer.borderColor = UIColor.black.cgColor
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var nameStackView: UIStackView = {
        let element = UIStackView(arrangedSubviews: [nameLabelPrefix, nameLabel])
        element.axis = .horizontal
        element.spacing = 5
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var positionStackView: UIStackView = {
        let element = UIStackView(arrangedSubviews: [positionLabelPrefix, fullPositionLabel])
        element.axis = .horizontal
        element.spacing = 5
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var addressStackView: UIStackView = {
        let element = UIStackView(arrangedSubviews: [addressLabelPrefix, fullAddressLabel])
        element.axis = .horizontal
        element.spacing = 5
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    
    private lazy var infoButton: UIButton = {
        let element = UIButton(type: .system)
        element.setTitle("Раскрыть инфо", for: .normal)
        element.tintColor = .systemIndigo
        element.addTarget(self, action: #selector(toggleInfo), for: .touchUpInside)
        element.titleLabel?.font = UIFont(name: "YSDisplay-Medium", size: 18)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var nameLabelPrefix: UILabel = {
        let element = UILabel()
        element.text = "Имя:"
        element.font = UIFont(name: "YSDisplay-Medium", size: 22)
        element.textColor = .darkGray
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var positionLabelPrefix: UILabel = {
        let element = UILabel()
        element.text = "Должность:"
        element.font = UIFont(name: "YSDisplay-Medium", size: 22)
        element.textColor = .darkGray
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var addressLabelPrefix: UILabel = {
        let element = UILabel()
        element.text = "Адрес:"
        element.font = UIFont(name: "YSDisplay-Medium", size: 22)
        element.textColor = .darkGray
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    
    private lazy var nameLabel: UILabel = {
        let element = UILabel()
        element.text = ""
        element.font = UIFont(name: "YSDisplay-Medium", size: 22)
        element.textColor = .black
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var fullPositionLabel: UILabel = {
        let element = UILabel()
        element.text = ""
        element.font = UIFont(name: "YSDisplay-Medium", size: 22)
        element.textColor = .black
        element.isHidden = true
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var fullAddressLabel: UILabel = {
        let element = UILabel()
        element.text = ""
        element.font = UIFont(name: "YSDisplay-Medium", size: 22)
        element.textColor = .black
        element.isHidden = true
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var copyAddressButton: UIButton = {
        let element = UIButton(type: .system)
        element.setTitle("Скопировать адрес", for: .normal)
        element.titleLabel?.font = UIFont(name: "YSDisplay-Medium", size: 16)
        element.setTitleColor(.lightGray, for: .normal)
        element.addTarget(self, action: #selector(copyAddress), for: .touchUpInside)
        element.isHidden = true
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        initialHideDetails()
        backButton()
    }
    
    private func initialHideDetails() {
        positionStackView.isHidden = true
        addressStackView.isHidden = true
        copyAddressButton.isHidden = true
    }
    
    // MARK: - Actions
    @objc private func toggleInfo() {
        let showingDetails = infoButton.tintColor == .red
        
        infoButton.tintColor = showingDetails ? .systemIndigo : .red
        infoButton.setTitle(showingDetails ? "Раскрыть инфо" : "Скрыть инфо", for: .normal)
        
        let shouldShowDetails = !showingDetails
        nameLabel.text = shouldShowDetails ? user.getFullName() : user.getShortName()
        
        positionStackView.isHidden = !shouldShowDetails
        fullPositionLabel.isHidden = !shouldShowDetails
        fullAddressLabel.isHidden = !shouldShowDetails
        addressStackView.isHidden = !shouldShowDetails
        copyAddressButton.isHidden = !shouldShowDetails
    }

    
    @objc private func copyAddress() {
        UIPasteboard.general.string = fullAddressLabel.text
    }
    
    
    // MARK: - Configure
    private var user: User!
    
    func configure(with user: User) {
        self.user = user
        userPhoto.image = user.userPhoto
        nameLabel.text = user.getShortName()
        fullPositionLabel.text = user.userPosition
        fullAddressLabel.text = user.userAddress
    }
    func backButton() {
        let backButton = UIBarButtonItem()
        backButton.title = "Назад"
        backButton.tintColor = .darkGray
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}

// MARK: - Setup

extension UserInfoViewController {
    
    private func setupViews() {
        view.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(userPhoto)
        mainStackView.addArrangedSubview(infoButton)
        mainStackView.addArrangedSubview(nameStackView)
        mainStackView.addArrangedSubview(positionStackView)
        positionStackView.addArrangedSubview(positionLabelPrefix)
        positionStackView.addArrangedSubview(fullPositionLabel)
        mainStackView.addArrangedSubview(addressStackView)
        mainStackView.addArrangedSubview(copyAddressButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            userPhoto.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5),
            userPhoto.widthAnchor.constraint(equalTo: userPhoto.heightAnchor)
        ])
    }
}
