//
//  HomeView.swift
//  demoSwiftui
//
//  Created by Mac on 27/04/21.
//

import SwiftUI

struct HomeView: View {
    
    var contactArray = [
        Contacts(name: "John", number: "+1987936474", lattitude: 18.5204 , longitude: 73.8567),
        Contacts(name: "Smith", number: "+1454587421", lattitude: 22.5726 , longitude: 88.3639),
        Contacts(name: "Medrid", number: "+45454415454", lattitude: 28.7041 , longitude: 77.1025),
        Contacts(name: "Li Quian", number: "+25563569582", lattitude: 21.1702 , longitude: 72.8311),
        Contacts(name: "Charmaine", number: "+787451121", lattitude: 23.0225 , longitude: 72.5714),
        Contacts(name: "Arlene", number: "+014545054545", lattitude: 22.3072 , longitude: 73.1812),
        Contacts(name: "Robert", number: "+9844121454", lattitude: 22.3039 , longitude: 70.8022),
        Contacts(name: "Arturo", number: "+9898454145", lattitude: 19.0760 , longitude: 72.8777),
        Contacts(name: "Sunil", number: "+32545441421", lattitude: 17.3850 , longitude: 78.4867)
    ]

    init() {
        UITableView.appearance().allowsSelection = false
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        NavigationView {
            List(contactArray) { contactsData in
                NavigationLink(destination: MapView(contacts: contactsData)) {
                    EmptyView()
                    ContactListCell(contacts: contactsData)
                }.background(Color.clear).clipShape(Rectangle())
            }.padding().background(Color.clear).navigationBarTitle("Contact List")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
