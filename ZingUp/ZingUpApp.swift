//
//  ZingUpApp.swift
//  ZingUp
//
//  Created by Scott on 12/16/20.
//

import SwiftUI

@main
struct ZingUpApp: App {
    @State private var scrums = DailyStandUp.data
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                StandUpsView(scrums: $scrums)
            }
            
        }
        
    }
}
