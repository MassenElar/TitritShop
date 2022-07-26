//
//  LoginView.swift
//  TitritShop
//
//  Created by developer on 7/25/22.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @Binding var index: Int
    @State var email = ""
    @State var password = ""
    @Binding var loggedIn: Bool
    var authViewModel = AuthViewModel()
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            VStack {
                
                HStack {
                    
                    VStack(spacing: 10) {
                        Text("Login")
                            .foregroundColor(self.index == 0 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 0 ? Color.blue: Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    
                    Spacer(minLength: 0)
                }
                .padding(.top, 30)
            
            
                VStack {
                    
                    HStack(spacing: 15) {
                        
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color.black)
                        
                        TextField("Email Address", text: self.$email)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
            
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color.black)
                        
                        SecureField("Password", text: self.$password)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                HStack {
                    Spacer(minLength: 0)
                    
                    Button(action: {}) {
                        Text("Forgot Password")
                            .foregroundColor(Color.white.opacity(0.6))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color("buttonColor"))
            .clipShape(loginShape())
            .contentShape(loginShape())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 0
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            Button(action: {
                self.authViewModel.login(email: email, password: password)
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color.black)
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y: 60)
            .opacity(self.index == 0 ? 1 : 0)
        }
        .onAppear() {
            Auth.auth().addStateDidChangeListener { auth, user in
                if user != nil {
                    self.loggedIn = true 
                }
            }
        }
        .fullScreenCover(isPresented: self.$loggedIn) {
            ContentView(rootIsActive: self.$loggedIn)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    
    @State static var value = 0
    @State static var value1 = false
    static var previews: some View {
        LoginView(index: $value, loggedIn: $value1)
    }
}
