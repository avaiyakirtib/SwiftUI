//
//  SigmaHomeView.swift
//  demoSwiftui
//
//  Created by Mac on 30/04/21.
//

import SwiftUI

struct SigmaHomeView: View {

    @State var showMenu = false
    var body: some View {
        
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
            }
        
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    MainView(showMenu: self.$showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                        .disabled(self.showMenu ? true : false)
                    if self.showMenu {
                        MenuView()
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    }
                }
                    .gesture(drag)
            }
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}

struct SigmaHomeView_Previews: PreviewProvider {
    static var previews: some View {
        SigmaHomeView()
    }
}
struct MainView: View {
    
    @Binding var showMenu: Bool
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
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack {
                    Button {
                        withAnimation {
                            self.showMenu = true
                        }
                    } label: {
                        Image(systemName: "line.horizontal.3").frame(width: 44, height: 44, alignment: .leading).foregroundColor(.white).imageScale(.large)
                    }
                    Spacer()
                    Text("Home").foregroundColor(.white).bold()
                    Spacer()
                    Button {
                        
                    } label: {
                        NavigationLink(destination: MessageView()) {
                            Image(systemName: "envelope").frame(width: 44, height: 44, alignment: .trailing).foregroundColor(.white).imageScale(.large)
                        }
                    }
                }.padding(.leading,10).padding(.trailing,10).frame(height: 44).background(Color.blue)
                HStack {
                    Spacer()
                    Image("logo").scaledToFit()
                    Spacer()
                }.padding(.leading,10).padding(.trailing,10).frame(height: 170).background(Color.blue)
                VStack {
                    List(contactArray) { contactsData in
                        NavigationLink(destination: MapView(contacts: contactsData).navigationTitle("UserLocation")) {
                            EmptyView()
                            ContactListCell(contacts: contactsData)
                        }.background(Color.clear).clipShape(Rectangle())
                    }
                }
            }.navigationBarTitle("").navigationBarHidden(true)
        }
    }
}
