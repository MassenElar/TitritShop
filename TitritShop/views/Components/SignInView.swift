//
//  SignInView.swift
//  TitritShop
//
//  Created by developer on 7/12/22.
//

import SwiftUI
import FirebaseAuth

struct SignInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var viewIsActive: Bool = false
    @State private var loggedIn = false
    var authViewModel = AuthViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Image("launchScreen")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75, height: 75)
                    .cornerRadius(10)
                
                VStack {
                    TextField("Email Adress", text: $email)
                        .padding()
                        .frame(width: 250,height: 45)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke()
                        )
                        .padding(5)
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 250,height: 45)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke()
                        )
                        .padding(5)
                    
                    Button(action: {
                        self.authViewModel.login(email: email, password: password)
                    }) {
                        Text("Sign In")
                            .padding()
                            .foregroundColor(.white)
                    }
                    
                    .padding()
                    .frame(width: 150, height: 40, alignment: .center)
                    .background(Color("buttonColor"))
                    .cornerRadius(10)
                    NavigationLink(
                        destination: RegisterView(shouldPopToRootView: self.$viewIsActive),
                        isActive: self.$viewIsActive
                    ) {
                        Text("New Member")
                            .padding()
                    }
                    .isDetailLink(false)
                    .padding()
                    .frame(width: 200, height: 40, alignment: .center)
                    .cornerRadius(10)
                    
                }
                .padding()
                Spacer()
                 
            }
            
            
        }
        .onAppear() {
            Auth.auth().addStateDidChangeListener { auth, user in
                if user != nil {
                    self.loggedIn.toggle()
                }
            }
        }
        .fullScreenCover(isPresented: self.$loggedIn) {
            ContentView(rootIsActive: self.$loggedIn)
        }
    
    }
}

struct SignInView_Previews: PreviewProvider {
    
    static var previews: some View {
        SignInView()
    }
}
