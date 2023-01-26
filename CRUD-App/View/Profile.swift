//
//  Profile.swift
//  CRUD-App
//
//  Created by Arief Ramadhan on 26/01/23.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "scribble.variable")
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
            
            Text("Name")
                .font(.title)
                .padding(.bottom, 10)
            
            Text("Detail Text")
                .font(.subheadline)
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
