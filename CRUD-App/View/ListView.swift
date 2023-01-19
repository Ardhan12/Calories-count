//
//  ListView.swift
//  CRUD-App
//
//  Created by Arief Ramadhan on 19/01/23.
//

import SwiftUI

struct CaloriesView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var foods: FetchedResults<Food>
    
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                Text("\(Int(totalCaloriesToday())) Kcal (Today)")
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                List{
                    ForEach(foods) { food in
                        NavigationLink(destination: EditItemView(food: food)){
                            HStack {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(food.name!)
                                        .bold()
                                    Text("\(Int(food.calories))") + Text(" Calories").foregroundColor(.red)
                                }
                                Spacer()
                                Text(calcTimeSince(date:food.date!))
                                    .foregroundColor(.gray)
                                        .italic()
                            }
                        }
                    }.onDelete(perform: deleteFood)
                }.listStyle(.plain)
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        showingSheet.toggle()
                    } label:
                    {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading){
                    EditButton()
                }
            }
            .sheet(isPresented: $showingSheet){
                AddItemView()
            }
            .navigationTitle("Calories Today")
        }
    }
    private func deleteFood(offsets: IndexSet) {
        withAnimation {
            offsets.map { foods[$0] }.forEach(managedObjContext.delete)
            
            DataController().save(context: managedObjContext)
        }
    }
    private func totalCaloriesToday() -> Double {
        var caloriesToday: Double = 0
        for item in foods {
            if Calendar.current.isDateInToday(item.date!){
                caloriesToday += item.calories
            }
        }
        return caloriesToday
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        CaloriesView()
    }
}
