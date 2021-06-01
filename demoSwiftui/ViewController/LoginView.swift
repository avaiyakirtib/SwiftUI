//
//  LoginView.swift
//  demoSwiftui
//
//  Created by Mac on 27/04/21.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20, content: {
                Image("profile").resizable().frame(width: 100, height: 100, alignment: .center).cornerRadius(50)
                TextField("Username", text: $username).padding(.leading,10).frame(height: 40).border(Color.gray)
                SecureField("Password", text: $password).padding(.leading,10).frame(height: 40).border(Color.gray)
                
                Button(action: {
                    print("Sign In")
                   
                }) {
                    NavigationLink(destination: SigmaHomeView().navigationTitle("").navigationBarHidden(true)) {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                        .navigationBarTitle("")
                        .navigationBarHidden(false)
                    }
                }.padding(.leading,50).padding(.trailing,50).frame(height: 50, alignment: .center).background(Color.black).listItemTint(Color.white).foregroundColor(Color.white).cornerRadius(10)
                Text("Don't have an account yet?").foregroundColor(Color.gray)
                Button(action: {
                    print("Sign In")
                }) {
                    NavigationLink(destination: RegistrationView()) {
                        Text("Register Now")
                            .font(.headline)
                            .foregroundColor(.black)
                        .navigationBarTitle("")
                        .navigationBarHidden(false)
                    }
                }
            }).padding(.leading,50).padding(.trailing,50)

        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
