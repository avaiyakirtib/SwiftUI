//
//  MenuView.swift
//  demoSwiftui
//
//  Created by Mac on 30/04/21.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button {
                } label: {
                    NavigationLink(destination: MessageView()) {
                        Image(systemName: "person")
                            .foregroundColor(.gray)
                            .imageScale(.large)
                        Text("Profile")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
            }
            .padding(.top, 100)
            HStack {
                Button {
                } label:{NavigationLink(destination: MessageView()) {
                Image(systemName: "envelope")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Messages")
                    .foregroundColor(.white)
                    .font(.headline) }
                }
            }
                .padding(.top, 30)
            HStack {
                Button {
                } label: {
                    NavigationLink(destination: MessageView()) {
                Image(systemName: "gear")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.headline)
                    }
                }
            }
            .padding(.top, 30)
            Spacer()
        }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(red: 32/255, green: 32/255, blue: 32/255))
            .edgesIgnoringSafeArea(.all)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
