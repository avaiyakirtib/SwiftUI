//
//  MapView.swift
//  demoSwiftui
//
//  Created by Mac on 28/04/21.
//

import SwiftUI
import MapKit
import CoreLocation

//struct MapView: UIViewRepresentable {
//    var contacts: Contacts
//    var body: some View {
//        VStack {
//            Text(contacts.name).font(.title)
//            HStack {
//                Text("\(contacts.number)")
//            }
////                annotationItems: [contacts]) {
////                    (location) -> MapPin in
////                let coordinate = CLLocationCoordinate2DMake(location.lattitude, location.longitude)
////                        MapPin(coordinate: coordinate)
////                })
//        }
//    }
//    func makeUIView(context: Context) -> MKMapView {
//           MKMapView(frame: .zero)
//       }
//
//       func updateUIView(_ view: MKMapView, context: Context) {
//
//
//           // 1
//           view.mapType = MKMapType.standard // (satellite)
//
//           // 2
//           let mylocation = CLLocationCoordinate2D(latitude: -6.863190,longitude: -79.818250)
//
//           // 3
//           let coordinate = CLLocationCoordinate2D(
//               latitude: -6.864138, longitude: -79.819634)
//           let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
//           let region = MKCoordinateRegion(center: coordinate, span: span)
//           view.setRegion(region, animated: true)
//
//           // 4
//           let annotation = MKPointAnnotation()
//           annotation.coordinate = mylocation
//
//           annotation.title = "My Location"
//           annotation.subtitle = "Visit us soon"
//           view.addAnnotation(annotation)
//
//
//
//
//
//
//       }
//}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView(contacts: <#Contacts#>)
//    }
//}
struct MapView: UIViewRepresentable {

    var contacts: Contacts
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        // 1
        view.mapType = MKMapType.standard // (satellite)

        // 2
        let mylocation = CLLocationCoordinate2D(latitude: contacts.lattitude,longitude: contacts.longitude)

        // 3
        let coordinate = CLLocationCoordinate2D(
            latitude: contacts.lattitude, longitude: contacts.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)

        getAddressFromLatLon(pdblLatitude: contacts.lattitude, withLongitude: contacts.longitude) { (address) in
            let annotation = MKPointAnnotation()
            annotation.coordinate = mylocation
            annotation.title = contacts.name
            annotation.subtitle = address
            view.addAnnotation(annotation)
        }
       
    }
    func getAddressFromLatLon(pdblLatitude: Double, withLongitude pdblLongitude: Double,completion : (@escaping(String) -> Void)) {
            var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
            let lat: Double = Double("\(pdblLatitude)")!
            //21.228124
            let lon: Double = Double("\(pdblLongitude)")!
            //72.833770
            let ceo: CLGeocoder = CLGeocoder()
            center.latitude = lat
            center.longitude = lon

            let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)


            ceo.reverseGeocodeLocation(loc, completionHandler:
                {(placemarks, error) in
                    if (error != nil)
                    {
                        print("reverse geodcode fail: \(error!.localizedDescription)")
                    }
                    let pm = placemarks! as [CLPlacemark]

                    if pm.count > 0 {
                        let pm = placemarks![0]
                        print(pm.country ?? "")
                        print(pm.locality ?? "")
                        print(pm.subLocality ?? "")
                        print(pm.thoroughfare ?? "")
                        print(pm.postalCode ?? "")
                        print(pm.subThoroughfare ?? "")
                        var addressString : String = ""
                        if pm.subLocality != nil {
                            addressString = addressString + pm.subLocality! + ", "
                        }
                        if pm.thoroughfare != nil {
                            addressString = addressString + pm.thoroughfare! + ", "
                        }
                        if pm.locality != nil {
                            addressString = addressString + pm.locality! + ", "
                        }
                        if pm.country != nil {
                            addressString = addressString + pm.country! + ", "
                        }
                        if pm.postalCode != nil {
                            addressString = addressString + pm.postalCode! + " "
                        }

                        completion(addressString)
                        print(addressString)
                  }
            })

        }
}
