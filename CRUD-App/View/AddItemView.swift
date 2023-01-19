//
//  DetailView.swift
//  CRUD-App
//
//  Created by Arief Ramadhan on 19/01/23.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var calories: Double = 0
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Food Name", text: $name)
                        VStack{
                            Text("Calories: \(Int(calories))")
                            Slider(value: $calories, in: 0...1000, step: 10)
                        }
                        .padding()
                    }
                }
                HStack{
                    Spacer()
                    Button {
                        DataController().addFood(name: name, calories: calories, context: managedObjContext)
                        dismiss()
                    } label: {
                        Text("Submit")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                
            }
            
            .navigationTitle("Add New Post")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}

/*.toolbar {
 ToolbarItem(placement: .navigationBarLeading) {
     Button("Cancel") {
         dismiss()
     }
 }
 ToolbarItem(placement: .navigationBarTrailing) {
     Button("Post") {
         print("button pressed")
     }
 }
}*/
