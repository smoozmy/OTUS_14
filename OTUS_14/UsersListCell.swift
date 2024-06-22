import UIKit

final class UsersListCell: UITableViewCell {
    
    static let identifier = "UsersListCell"
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 25
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var userPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.tintColor = .gray
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var positionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .darkText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(userPhoto)
        containerView.addSubview(nameLabel)
        containerView.addSubview(positionLabel)
        
        // Ensuring the selection style is none to prevent default highlighting
        selectionStyle = .none
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            userPhoto.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            userPhoto.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            userPhoto.widthAnchor.constraint(equalToConstant: 50),
            userPhoto.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.leadingAnchor.constraint(equalTo: userPhoto.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            
            positionLabel.leadingAnchor.constraint(equalTo: userPhoto.trailingAnchor, constant: 10),
            positionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            positionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            positionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
        ])
    }
    
    func configure(with user: User) {
        userPhoto.image = user.userPhoto
        nameLabel.text = user.getFullName()
        positionLabel.text = user.userPosition
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        containerView.backgroundColor = highlighted ? .darkGray : .lightGray
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        containerView.backgroundColor = selected ? .darkGray : .lightGray
    }
}
