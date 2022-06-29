//
//  NetworkingError.swift
//  TitritShop
//
//  Created by developer on 6/27/22.
//

import Foundation


enum NetworkingError: Error {
    case dataNotFound
    case cannotSaveData
    case serverError
    case unautorized
}
