//
//  ContentView.swift
//  TitritShop
//
//  Created by developer on 6/27/22.
//

import SwiftUI

struct ContentView: View {
    
   
    @Environment(\.presentationMode) var presentationMode
    @State var products = [Product]()
    
    @StateObject var carViewModel = CartViewModel()
    
    var quantity: Int = 0
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    @Binding var rootIsActive: Bool
    
    
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
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            CartView()
                                .environmentObject(carViewModel)
                        } label: {
                            cartButton()
                                .environmentObject(carViewModel)
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink {
                            ProfileView(viewIsPersent: self.$rootIsActive)
                        } label: {
                            Image(systemName: "person")
                                .foregroundColor(.black)
                                
                        }
                        .isDetailLink(false)
                        .foregroundColor(.black)
                    }
                   
                }
                
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(.black)
    
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    @State static var value = false
    static var previews: some View {
        ContentView(rootIsActive: $value)
    }
}
