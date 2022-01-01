//
//  Constant.swift
//  Aero
//
//  Created by Luke Mason on 1/1/22.
//

import SwiftUI

// MARK: - FORMATTER
let activityFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .none
    return formatter
}()

let decimalFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.maximumFractionDigits = 2
    formatter.numberStyle = .decimal
    return formatter
}()


// MARK: - UI

// MARK: - UX
