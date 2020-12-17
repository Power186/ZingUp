//
//  StandUpsView.swift
//  ZingUp
//
//  Created by Scott on 12/16/20.
//

import SwiftUI

struct StandUpsView: View {
    @Binding var scrums: [DailyStandUp]
    
    var body: some View {
        List {
            ForEach(scrums) { scrum in
                NavigationLink(destination: StandUpDetailView(scrum: binding(for: scrum))) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.color)
            }
        }
        .navigationTitle("Daily Stand Ups")
        .navigationBarItems(trailing: Button(action: {}) {
            Text("Add")
            Image(systemName: "plus")
        })
        .listStyle(InsetListStyle())
        
    }
    
    private func binding(for scrum: DailyStandUp) -> Binding<DailyStandUp> {
        guard let scrumIndex = scrums.firstIndex(where: { $0.id == scrum.id }) else {
            fatalError("Cant find scrum in array")
        }
        return $scrums[scrumIndex]
    }
    
}

struct StandUpsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StandUpsView(scrums: .constant(DailyStandUp.data))
        }
    }
}
