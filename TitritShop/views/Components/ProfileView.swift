//
//  ProfileView.swift
//  TitritShop
//
//  Created by developer on 7/15/22.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct ProfileView: View {
    
    @State var fullname: String = ""
    @State var email: String = ""
    @Binding var shouldPopToRootView : Bool
    var authViewModel = AuthViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Full Name: \(fullname)")
                .padding(.bottom)
            Text("Email: \(email)")
                .padding(.bottom)
                
            VStack {
                Button {
                    if self.authViewModel.logOut() {
                        self.shouldPopToRootView = false
                    }
                } label: {
                    Text("Logout")
                        .foregroundColor(.white)
                }
                .padding()
                .frame(width: 150,alignment: .center)
                .background(Color("buttonColor"))
                .cornerRadius(10)
            }
            .frame(maxWidth: .infinity)
            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 300, alignment: .topLeading)
        .padding()
        .onAppear() {
            getData()
        }
    }
    
    func getData() {
        let uid = Auth.auth().currentUser?.uid
        let ref = Database.database().reference()
        ref.child("titrit/users/\(uid ?? "")").observeSingleEvent(of: .value) { snapShot in
            let value = snapShot.value as? NSDictionary
            let fn = value?["fullName"] as? String ?? ""
            let em = value?["email"] as? String ?? ""
            self.email = em
            self.fullname = fn
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    @State static var value = true
    static var previews: some View {
        ProfileView(shouldPopToRootView: $value)
    }
}
