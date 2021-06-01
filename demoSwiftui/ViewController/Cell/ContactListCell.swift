//
//  ContactListCell.swift
//  demoSwiftui
//
//  Created by Mac on 27/04/21.
//

import SwiftUI
import UIKit

struct Contacts: Identifiable {
    let id = UUID()
    let name: String
    let number : String
    let lattitude : Double
    let longitude : Double
}

// A view that shows the data for one Restaurant.
struct ContactListCell: View {
    
    @State private var selection: Int? = nil

    var contacts: Contacts

    var body: some View {
        HStack(spacing: 10) {
            Image("profile").resizable().frame(width: 50, height: 50).clipShape(Circle())
            VStack(spacing: 8) {
                Text("\(contacts.name)").frame(maxWidth: .infinity, alignment: .leading)
                Text("\(contacts.number)").frame(maxWidth: .infinity, alignment: .leading)
            }
        }.padding(.leading,10).padding(.trailing,10).frame(height: 90)
     }
}
