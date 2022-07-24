//
//  RegisterView.swift
//  TitritShop
//
//  Created by developer on 7/12/22.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import Firebase

struct RegisterView: View {
    
    @State var email: String = ""
    @State var fullName: String = ""
    @State var password: String = ""
    @State var confrimPassword: String = ""
    @Binding var shouldPopToRootView : Bool
    @State private var viewIsPresente = false
    var authViewModel = AuthViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Image("launchScreen")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75, height: 75)
                    .cornerRadius(10)
                
                VStack(alignment: .center) {
                    TextField("Email Adress", text: $email)
                        .padding()
                        .frame(width: 250,height: 45)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke()
                        )
                        .padding(5)
                    TextField("Full Name", text: $fullName)
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
                    SecureField("Confirm Password", text: $confrimPassword)
                        .padding()
                        .frame(width: 250,height: 45)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke()
                        )
                        .padding(5)
                    Button(action: { self.authViewModel.register(email: email, password: password, confirmPass: confrimPassword, fullName: fullName)}) {
                        Text("Register")
                            .padding()
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(width: 150, height: 40, alignment: .center)
                    .background(Color("buttonColor"))
                    .cornerRadius(10)
                    Button(action: {
                        self.shouldPopToRootView = false
                    }) {
                        Text("Log In")
                            .padding()
                    }
                    .padding()
                    .frame(width: 150, height: 40, alignment: .center)
                    .cornerRadius(10)
                    
                }
                .padding()
                Spacer()
            }
            
        }
        .navigationTitle(Text("Create New Account"))
        .navigationBarTitleDisplayMode(.automatic)
        .navigationBarBackButtonHidden(true)
        .onAppear() {
            Auth.auth().addStateDidChangeListener { auth, user in
                if user != nil {
                    self.viewIsPresente.toggle()
                }
            }
        }
        .fullScreenCover(isPresented: $viewIsPresente) {
            ContentView(rootIsActive: $viewIsPresente)
        }
    }
}
    


struct RegisterView_Previews: PreviewProvider {
    
    @State static var value = false
    static var previews: some View {
        Group {
            RegisterView(shouldPopToRootView: $value)
        }
    }
}
