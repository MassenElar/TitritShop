//
//  SignUpView.swift
//  TitritShop
//
//  Created by developer on 7/25/22.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import Firebase

struct SignUpView: View {
    
    
    @Binding var index: Int
    @State var email = ""
    @State var password = ""
    @State var repass = ""
    @State var fullName = ""
    @Binding var viewIsPresente: Bool
    var authViewModel = AuthViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            VStack {
                
                HStack {
                    
                    Spacer(minLength: 0)
                    
                    VStack(spacing: 10) {
                        Text("Sign Up")
                            .foregroundColor(self.index == 1 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 1 ? Color.blue: Color.clear)
                            .frame(width: 100, height: 5)
                    }

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
                        
                        Image(systemName: "person")
                            .foregroundColor(Color.black)
                        
                        TextField("Full Name", text: self.$fullName)
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
                
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color.black)
                        
                        SecureField("Re-enter Password", text: self.$repass)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
            
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color("buttonColor"))
            .clipShape(signUpShape())
            .contentShape(signUpShape())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 1
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            Button(action: {
                self.authViewModel.register(email: email, password: password, confirmPass: repass, fullName: fullName)
                self.deinitInputs()
            }) {
                Text("Register")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color.black)
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y: 25)
            .opacity(self.index == 1 ? 1 : 0)
        }
        .onAppear() {
            Auth.auth().addStateDidChangeListener { auth, user in
                if user != nil {
                    self.viewIsPresente = true 
                }
            }
        }
        .fullScreenCover(isPresented: $viewIsPresente) {
            ContentView(rootIsActive: $viewIsPresente)
        }
    }
        
    
    func deinitInputs() {
            self.email = ""
            self.password = ""
            self.fullName = ""
            self.repass = ""
    }
}

struct SignUpView_Previews: PreviewProvider {
    
    @State static var value = 1
    @State static var value1 = false
    
    static var previews: some View {
        SignUpView(index: $value, viewIsPresente: $value1)
    }
}
