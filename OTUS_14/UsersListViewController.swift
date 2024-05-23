//
//  UsersListViewController.swift
//  OTUS_14
//
//  Created by Александр Крапивин on 23.05.2024.
//

import UIKit

import UIKit

final class UsersListsViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let element = UITableView()
        element.backgroundColor = .systemPink
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - UI and Lyfe Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .bgColor
        
        setView()
        setupConstraints()
    }
    private func setView() {
        view.addSubview(tableView)
    }
    
    // MARK: - Actions
    
}

// MARK: - Constraints

extension UsersListsViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}

