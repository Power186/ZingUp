//
//  EventView.swift
//  ZingUp
//
//  Created by Scott on 12/19/20.
//

import SwiftUI

struct EventView: View {
    @Binding var scrum: DailyStandUp
    @State private var date = Date()
    @State private var note = ""
    
    var body: some View {
        List {
            Section(header: Text("Team")) {
                HStack {
                    Spacer()
                    Text("\(scrum.title)")
                        .font(.headline)
                    Spacer()
                }
            }
            
            Section(header: Text("Length")) {
                HStack {
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                }
            }
            
            Section(header: Text("Meeting Date")) {
                DatePicker("", selection: $date)
                    .datePickerStyle(GraphicalDatePickerStyle())
            }
            
            Section(header: Text("Quick Note")) {
                TextField("Type here", text: $note)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
        }
        .navigationBarItems(trailing: Button(action: {}) {
            Label("Share", systemImage: "square.and.arrow.up")
                .font(.headline)
                .foregroundColor(.accentColor)
        })
        .padding()
        .shadow(color: scrum.color, radius: 6)
        
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(scrum: .constant(DailyStandUp.data[0]))
    }
}
