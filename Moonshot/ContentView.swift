//
//  ContentView.swift
//  Moonshot
//
//  Created by Syrene Haber Bartolome on 2024/10/30.
//

import SwiftUI

// Grid View for displaying missions as a grid
struct MissionGridView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        ScrollView {  // Wrapping the grid in a ScrollView to make it scrollable
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
        .background(.darkBackground)
        .cornerRadius(20)  // Optional: to add rounded corners if desired
        .padding(.top, 10)  // Add some top padding to avoid overlap with the navigation bar
    }
}

// List View for displaying missions as a list
struct MissionListView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        List(missions) { mission in
            NavigationLink {
                MissionView(mission: mission, astronauts: astronauts)
            } label: {
                HStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .padding()
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                            .foregroundStyle(.white)
                        
                        Text(mission.formattedLaunchDate)
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.5))
                    }
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(.lightBackground)
                }
                .padding(.vertical)
                .background(.lightBackground)
                .clipShape(.rect(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.lightBackground)
                )
            }
        }
        .listStyle(.plain)
        .padding(.top, 10)  // Adding padding to avoid overlap with the navigation bar
    }
}

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var isGridView: Bool = true  // Track the current view type
    
    var body: some View {
        NavigationStack {
            VStack {
                // Conditionally render Grid or List view based on isGridView state
                if isGridView {
                    MissionGridView(missions: missions, astronauts: astronauts)
                } else {
                    MissionListView(missions: missions, astronauts: astronauts)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isGridView.toggle()  // Toggle between grid and list view
                    }) {
                        Image(systemName: isGridView ? "list.bullet" : "square.grid.2x2")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
