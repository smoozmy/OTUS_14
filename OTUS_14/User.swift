//
//  UserModel.swift
//  OTUS_14
//
//  Created by Александр Крапивин on 22.06.2024.
//

import UIKit

class User {
    let userPhoto: UIImage
    let userFirstName: String
    let userLastName: String
    let userPosition: String
    let userAddress: String
    
    init(userPhoto: UIImage, userFirstName: String, userLastName: String, userPosition: String, userAddress: String) {
        self.userPhoto = userPhoto
        self.userFirstName = userFirstName
        self.userLastName = userLastName
        self.userPosition = userPosition
        self.userAddress = userAddress
    }
    
    func getFullName() -> String {
        "\(userFirstName) \(userLastName)"
    }
    
    func getShortName() -> String {
        "\(userFirstName.prefix(1)). \(userLastName)"
    }
}
