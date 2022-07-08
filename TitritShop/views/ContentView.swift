//
//  ContentView.swift
//  TitritShop
//
//  Created by developer on 6/27/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var products = [Product]()
    
    @StateObject var carViewModel = CartViewModel()
    
    var quantity: Int = 0
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        
        NavigationView {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(products, id: \.id) { product in
                            ProductCard(product: product)
                                .environmentObject(carViewModel)
                        }
                    }
                    .onAppear() {
                        makupProduct().getProduct { result in
                            switch result {
                            case.success(let p):
                                self.products = Array(p[60...90])
                            case .failure(let e):
                                print(e.localizedDescription)
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle("TiTriT Shop")
                .toolbar {
                    NavigationLink {
                        CartView()
                            .environmentObject(carViewModel)
                    } label: {
                        cartButton()
                            .environmentObject(carViewModel)
                    }
                    
                    
                }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
