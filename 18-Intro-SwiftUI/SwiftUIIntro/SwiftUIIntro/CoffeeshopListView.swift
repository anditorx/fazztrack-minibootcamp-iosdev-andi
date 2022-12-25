//
//  CoffeeshopListView.swift
//  SwiftUIIntro
//
//  Created by Armstrong on 25/12/22.
//

import SwiftUI

struct CoffeeshopListView: View {
    
    
    
    // MARK: Properties
    @State var coffeeshops = [
        Coffeeshop(name: "Boja Eatery", type: "Jl. Pungkur", location: "Coffeeshop / Cafe", image: "bojaeatery", isFavorite: false),

            Coffeeshop(name: "Brewery Coffee", type: "Jl. Buahbatu", location: "Tea House", image: "brewery", isFavorite: false),

            Coffeeshop(name: "Casadela Coffee", type: "Jl. Asia Afrika", location: "Cafe Shop", image: "casadela", isFavorite: false),

            Coffeeshop(name: "Dago Terrace", type: "Jl. Sabang", location: "Warmindo", image: "dagoterrace", isFavorite: false),

            Coffeeshop(name: "Hola Koffie", type: "Jl. Setiabudi", location: "Coffeeshop / Cafe", image: "holakoffie", isFavorite: false),
       
            Coffeeshop(name: "Imah Kai", type: "Jl. Buahbaty", location: "Bakery", image: "imahkai", isFavorite: false),

            Coffeeshop(name: "Jiwan Kopi", type: "Jl. Sukabumi", location: "Cafe", image: "jiwan", isFavorite: false),

            Coffeeshop(name: "Kilogram Space", type: "Jl. Soekarno Hatta", location: "Home Coffee", image: "kilogram", isFavorite: false),

            Coffeeshop(name: "Masagi Coffee", type: "Jl. Kopo", location: "Bakery / Cafe", image: "masagi", isFavorite: false),

            Coffeeshop(name: "Nannys Pavillion", type: "Jl. Dago", location: "Tea House / Cafe", image: "nannys", isFavorite: false),
        
            Coffeeshop(name: "Sabana Kopi", type: "Jl. Cibiru", location: "Coffeeshop / Bakery", image: "sabanakopi", isFavorite: false),

            Coffeeshop(name: "Sini Kupi", type: "Jl. Aceh", location: "Coffeeshop / Milk House", image: "sinikupi", isFavorite: false),

            Coffeeshop(name: "Sonowae Kopi", type: "Jl. Cihapit", location: "Coffeeshop / Cafe", image: "sonowae", isFavorite: false),

            Coffeeshop(name: "Starbuck Coffee", type: "Jl. Gandapura", location: "Bakery", image: "starbuck", isFavorite: false),

            Coffeeshop(name: "Urra Cafe", type: "Warmindo", location: "Jl. Riau", image: "urracafe", isFavorite: false)
    ]
    
    @State var isCoffeeshopFavorites = Array(repeating: false, count: 15)
    
    // MARK: Body
    var body: some View {
        List {
            ForEach(coffeeshops.indices, id: \.self) { index in
                
                StandardRowView(coffeeshop: $coffeeshops[index])
                
            } //: LOOP
        } //: LIST
        .listStyle(.plain)
    }
}

// MARK: Standard Layout
struct StandardRowView: View {
    
    @State private var showAlert: Bool = false
    @State private var showOptions: Bool = false
    
    @Binding var coffeeshop: Coffeeshop
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Image(coffeeshop.image)
                .resizable()
                .frame(width: 75, height: 75)
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 5) {
                Text(coffeeshop.name)
                    .lineLimit(2)
                    .font(.title2)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                Text(coffeeshop.location)
                    .lineLimit(2)
                    .font(.subheadline)
                Text(coffeeshop.type)
                    .lineLimit(2)
                    .font(.caption2)
                    .foregroundColor(.gray)
                
                
            } //: VSTACK
            Spacer()
            if coffeeshop.isFavorite {
                Image(systemName: "heart.fill")
                    .foregroundColor(.yellow)
            }
        } //: HSTACK
        .onTapGesture {
            showOptions.toggle()
        }
        .confirmationDialog("What do you want to do?", isPresented: $showOptions, titleVisibility: .visible) {
            
            Button("Reserve a table"){
                self.showAlert.toggle()
            }
            Button(coffeeshop.isFavorite ? "Remove from favorite" : "Mark as favorite"){
                self.coffeeshop.isFavorite.toggle()
            }
            
        }
        .alert("Not yet available", isPresented: $showAlert, actions: {
            Button("OK") {}
        }, message: {
            Text("Sorry, this feature is not available yet")
        })
    }
}

// MARK: Compact Layout
struct CompactRowView: View {
    
    var imageName: String
    var name: String
    var type: String
    var location: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 5) {
                Text(name)
                    .lineLimit(2)
                    .font(.title2)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                Text(location)
                    .lineLimit(2)
                    .font(.subheadline)
                Text(type)
                    .lineLimit(2)
                    .font(.caption2)
                    .foregroundColor(.gray)
            } //: VSTACK
        }
    }
}

// MARK: Preview
struct CoffeeshopListView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeshopListView()
    }
}
