//
//  CrewRoster.swift
//  Moonshot
//
//  Created by Dom Bryan on 12/01/2022.
//

import SwiftUI

struct CrewRoster: View {
    let crew: [MissionView_.CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { CrewMember in
                    NavigationLink {
                        AstronautView(astronaut: CrewMember.astronaut)
                    } label: {
                        HStack {
                            Image(CrewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Rectangle())
                                .overlay(
                                    Rectangle()
                                         .strokeBorder(.black, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading) {
                                Text(CrewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .accessibilityLabel(CrewMember.astronaut.name.replacingOccurrences(of: ".", with: " "))
                                
                                Text(CrewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct CrewRoster_Previews: PreviewProvider {
    static var previews: some View {
        CrewRoster(crew: [])
    }
}
