//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Kristiyan Dilov on 03/03/2024.
//

import SwiftUI


struct ScrumsView: View {
    let scrums: [DailyScrum]
    var body: some View {
        
        NavigationStack {
            List(scrums) {scrum in
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)
                }.listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrum")
            .toolbar{
                Button(action: {}){
                    Image(systemName: "plus")
                }.accessibilityLabel("New Scrum")
            }
        }
    }
}


struct ScrumsViewPreview: PreviewProvider{
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.sampleData)
    }
}
