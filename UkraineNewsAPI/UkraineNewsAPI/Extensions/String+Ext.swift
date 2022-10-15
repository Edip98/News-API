//
//  String+Ext.swift
//  UkraineNewsAPI
//
//  Created by Эдип on 15.10.2022.
//

import Foundation

extension String {
    func formattedDate() -> String {
        let dateString = try? Date(self, strategy: .iso8601)
        let formattedDate = dateString?.formatted(.dateTime.day().month().hour().minute().locale(Locale(identifier: "uk"))) ?? ""
        return formattedDate
    }
}
