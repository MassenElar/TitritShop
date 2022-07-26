//
//  cartButton.swift
//  TitritShop
//
//  Created by developer on 6/28/22.
//

import SwiftUI

struct cartButton: View {
    
    @EnvironmentObject var carViewModel: CartViewModel
    
//    var numberOfItems: Int
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart")
                .padding([.top, .trailing], 10.0)
                .foregroundColor(.black)
            
            if carViewModel.quantity > 0 {
                Text("\(carViewModel.quantity)")
                    .font(.caption).bold()
                    .foregroundColor(.white)
                    .frame(width: 20, height: 20)
                    .background(Color(hue: 0.974, saturation: 1.0, brightness: 1.0, opacity: 0.872))
                    .cornerRadius(50)
                    
            }
        }
       
    }
}

struct cartButton_Previews: PreviewProvider {
    static var previews: some View {
        cartButton()
            
    }
}
