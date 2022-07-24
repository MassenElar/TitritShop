//
//  AuthViewModel.swift
//  TitritShop
//
//  Created by developer on 7/15/22.
//

import Foundation
import Firebase
import FirebaseAuth



struct AuthViewModel {
    
    
    func register(email: String, password: String, confirmPass: String, fullName: String) {
        if password != confirmPass {
            print("password dosnt match")
            return
        } else {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if error == nil {
                    let uid = Auth.auth().currentUser?.uid
                    let ref = Database.database().reference(withPath: "titrit/users").child(uid ?? "")
                    ref.setValue(["uid": uid, "email": email, "fullName": fullName])
                    print("user registred")
                } else {
                    print("registration failed")
                }
            }
        }
    }
    
    func login(email: String, password: String) {
      
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error == nil {
                print("User logged in")
      
            } else {
                print(error?.localizedDescription ?? "log in failed")
            }
        }
    }
    
    func logOut() -> Bool {
        let fbAuth = Auth.auth()
        do {
            try fbAuth.signOut()
            print("User logged Out")
            return true
        } catch {
            print("Error loggin out: %@", error)
            return false
        }
    }
}
