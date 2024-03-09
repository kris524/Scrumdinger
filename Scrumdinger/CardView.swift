//
//  CardView.swift
//  Scrumdinger
//
//  Created by Kristiyan Dilov on 02/03/2024.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title).font(.headline).accessibilityAddTraits(/*@START_MENU_TOKEN@*/.isHeader/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3").accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
                    .labelStyle(.trailingIcon)
            }.font(.caption)
        }.padding().foregroundColor(scrum.theme.accentColor)
    }
}


struct CardView_Preview: PreviewProvider {
    static var scrum = DailyScrum.sampleData[0]
    static var previews: some View {
        
        CardView(scrum: scrum)
            .background(scrum.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}