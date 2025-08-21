//
//  AppAlert.swift
//  DoperApp
//
//  Created by Cédric Bahirwe on 21/08/2025.
//
import Foundation

protocol AppAlert: Identifiable {
    var title: String { get }
    var message: String? { get }
    var actions: [AlertAction]? { get }
}
