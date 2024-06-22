//
//  UsersListsViewController.swift
//  OTUS_14
//
//  Created by Александр Крапивин on 23.05.2024.
//

import UIKit

final class UsersListsViewController: UIViewController {
    
    var usersArray: [User] = [
        User(userPhoto: UIImage(named: "boy") ?? UIImage(named: "person.fill")!, userFirstName: "Волт", userLastName: "Бой", userPosition: "Маскот", userAddress: "Штаб-квартира «Волт-Тек»"),
        User(userPhoto: UIImage(named: "tommy") ?? UIImage(systemName: "person.fill")!, userFirstName: "Томми", userLastName: "Версетти", userPosition: "Бизнесмен", userAddress: "Вайс-Сити"),
        User(userPhoto: UIImage(named: "natan") ?? UIImage(systemName: "person.fill")!, userFirstName: "Нейтан", userLastName: "Дрейк", userPosition: "Водолаз", userAddress: "Новый Орлеан"),
        User(userPhoto: UIImage(named: "freeman") ?? UIImage(systemName: "person.fill")!, userFirstName: "Гордон", userLastName: "Фримен", userPosition: "Ученый", userAddress: "Сити 17"),
        User(userPhoto: UIImage(named: "tony") ?? UIImage(systemName: "person.fill")!, userFirstName: "Тони", userLastName: "Старк", userPosition: "Железный человек", userAddress: "Нью-Йорк"),

    ]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UsersListCell.self, forCellReuseIdentifier: UsersListCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: - UI and Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setView()
        setupConstraints()
    }
    
    private func setView() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}

extension UsersListsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UsersListCell.identifier, for: indexPath) as? UsersListCell else {
            return UITableViewCell()
        }
        let user = usersArray[indexPath.row]
        cell.configure(with: user)
        return cell
    }
}

extension UsersListsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = usersArray[indexPath.row]
        
        let userInfoVC = UserInfoViewController()
        userInfoVC.configure(with: user)
        navigationController?.pushViewController(userInfoVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
}
