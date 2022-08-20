//
//  Recipe.swift
//  SwiftSoupDemo
//
//  Created by 최은성 on 2022/08/19.
//

import Foundation

struct Recipe: Identifiable, Hashable {
    let id = UUID().uuidString
    var contents: String
}
