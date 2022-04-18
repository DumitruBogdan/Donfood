//
//  DonfoodApp.swift
//  Donfood
//
//  Created by Bogdan on 18.04.2022.
//

import SwiftUI

@main
struct DonfoodApp: App {
    @State private var restaurants = Restaurant.sampleData
    var body: some Scene {
        WindowGroup {
            NavigationView {
                RestaurantsView(restaurants: $restaurants)
            }
        }
    }
}
