//
//  HomeMenuView.swift
//  Chef
//
//  Created by Daniel Watson on 03/09/2020.
//  Copyright © 2020 Daniel Watson. All rights reserved.
//

import SwiftUI

struct HomeMenuView: View {
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        NavigationView {
        ZStack {
            Rectangle()
                .fill(Color("lemon"))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                NavigationLink(destination: IngredientManager()) {
                    MenuButton(buttonName: "Ingredients", fill: Color("red"))
                    }
                NavigationLink(destination: Text("Second Menu")) {
                    MenuButton(buttonName: "Preperation", fill: Color("orange"))
                    }
                NavigationLink(destination: Text("Second Menu")) {
                    MenuButton(buttonName: "Menu Design", fill: Color("yellow" ))
                    }
                NavigationLink(destination: Text("Second Menu")) {
                    MenuButton(buttonName: "Stock Ordering", fill: Color("blue"))
                }
                Spacer()
            }
            .font(.largeTitle)
            }
        .navigationBarTitle("Oui Chef")
        }
    }
}

struct MenuButton: View {
    
    var buttonName: String
    var fill: Color
    
    var body : some View {
        ZStack(alignment: .leading) {
            Rectangle()
            .fill(fill)
            .frame(width: 300, height: 60)
            .cornerRadius(10)
            .shadow(radius: 5)
            Text(buttonName)
                .foregroundColor(Color("lemon"))
                .padding()
                
        }
    }
}

struct HomeMenuView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMenuView()
    }
}
struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton(buttonName: "Ingredients", fill: Color("blue"))
    }
}
