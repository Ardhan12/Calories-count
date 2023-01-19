//
//  EditItemView.swift
//  CRUD-App
//
//  Created by Arief Ramadhan on 19/01/23.
//

import SwiftUI

struct EditItemView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    var food: FetchedResults<Food>.Element
    @State private var name = ""
    @State private var calories: Double = 0
    
    var body: some View {
        VStack {
            Form {
                Section{
                    TextField("\(food.name!)", text: $name)
                        .onAppear{
                            name = food.name!
                            calories = food.calories
                        }
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
                    DataController().editFood(food: food, name: name, calories: calories, context: managedObjContext)
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
        
    }
}

