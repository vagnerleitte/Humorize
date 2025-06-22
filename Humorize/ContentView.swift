//
//  ContentView.swift
//  Humorize
//
//  Created by Vagner Leite da Silva on 07/06/25.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Label("inicio", systemImage: "house")
                }
           
            ProfileView()
                .tabItem {
                    Label("Perfil", systemImage: "person.crop.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
