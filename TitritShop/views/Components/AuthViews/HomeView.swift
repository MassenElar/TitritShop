//
//  HomeView.swift
//  TitritShop
//
//  Created by developer on 7/25/22.
//

import SwiftUI

struct HomeView: View {
    
    @State var index = 0
    @State var viewIsActive: Bool = false
    
    var body: some View {
        GeometryReader {_ in
            VStack {
                Image("launchScreen")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(10)
                    .shadow(color: Color.black, radius: 2, x: 2, y: 2)
                ZStack {
                    SignUpView(index: self.$index, viewIsPresente: $viewIsActive)
                        .zIndex(Double(self.index))
                    LoginView(index: self.$index, loggedIn: $viewIsActive)
                }
                
                HStack(spacing: 15) {
                    Rectangle()
                        .fill(Color("buttonColor"))
                        .frame(height: 1)
                    
                    Text("OR")
                    Rectangle()
                        .fill(Color("buttonColor"))
                        .frame(height: 1)
                }
                .padding(.horizontal, 30)
                .padding(.top, 50)
                
                HStack(spacing: 25) {
                    
                    Button(action: {}) {
                        Image("facebook")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    }
                    
                    Button(action: {}) {
                        Image("instagram")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    }
                    
                    Button(action: {}) {
                        Image("google")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    }
                    
                }
                .padding(.top, 30)
                
            }
            .padding(.vertical)
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}


struct loginShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}

struct signUpShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 150))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
    }
}
