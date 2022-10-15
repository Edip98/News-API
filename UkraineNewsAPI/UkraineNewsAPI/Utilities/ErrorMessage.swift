//
//  ErrorMessage.swift
//  UkraineNewsAPI
//
//  Created by Эдип on 14.10.2022.
//

import Foundation


enum ErrorMessage: String, Error {
    case invalidURL = "There was an issue connacting to the server. If this persists, please contact support."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data recevied from the server was invalid. Please try again."
}
