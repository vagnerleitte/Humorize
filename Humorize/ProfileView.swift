//
//  ProfileView.swift
//  Humorize
//
//  Created by Vagner Leite da Silva on 21/06/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Meu Perfil")
            }.navigationTitle("Perfil")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
