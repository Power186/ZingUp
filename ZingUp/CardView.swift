//
//  CardView.swift
//  ZingUp
//
//  Created by Scott on 12/16/20.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyStandUp
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .padding(.leading, 20)
                .padding(.top, 8)
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .padding(.leading, 20)
                    .padding(.bottom, 8)
                    .foregroundColor(.black)
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Attendees"))
                    .accessibilityValue(Text("\(scrum.attendees.count)"))
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .padding(.trailing, 20)
                    .padding(.bottom, 8)
                    .foregroundColor(.black)
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Meeting length"))
                    .accessibilityValue(Text("\(scrum.lengthInMinutes) minutes"))
            }
            .font(.subheadline)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum = DailyStandUp.data[0]
    
    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.color)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
