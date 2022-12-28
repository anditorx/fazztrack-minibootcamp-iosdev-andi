//
//  CoffeeshopDetailView.swift
//  SwiftUIIntro
//
//  Created by Armstrong on 28/12/22.
//

import SwiftUI

struct CoffeeshopDetailView: View {
    
    // MARK: PROPERTIES
    var coffeeshop: Coffeeshop
    
    // MARK: BODY
    var body: some View {
        ZStack {
            Image(coffeeshop.image)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
            .ignoresSafeArea()
            
            Color.black
                .frame(height: 200)
                .opacity(0.8)
                .cornerRadius(20)
                .padding()
                .overlay {
                    VStack {
                        Text(coffeeshop.name)
                        Text(coffeeshop.location)
                        Text(coffeeshop.type)
                    }
                    .foregroundColor(.white)
                    .font(.largeTitle)
                }
            
        }
        
        
        
    }
}

struct CoffeeshopDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeshopDetailView(coffeeshop: Coffeeshop(name: "Imah Kai", type: "Cafe", location: "Surabaya", image: "imahkai", isFavorite: true))
    }
}
