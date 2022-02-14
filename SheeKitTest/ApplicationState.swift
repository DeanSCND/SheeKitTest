//
//  ApplicationState.swift
//  SheeKitTest
//
//  Created by Dean on 2022-02-14.
//
import SwiftUI


@MainActor class ApplicationState: ObservableObject {
    
    @Published var name = "Dean"
}
