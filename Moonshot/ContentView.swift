//
//  ContentView.swift
//  Moonshot
//
//  Created by Syrene Haber Bartolome on 2024/10/30.
//

import SwiftUI

struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        Text(String(astronauts.count))
    }
}

#Preview {
    ContentView()
}
