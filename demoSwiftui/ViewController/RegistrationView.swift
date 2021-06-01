//
//  registrationView.swift
//  demoSwiftui
//
//  Created by Mac on 27/04/21.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var showImagePicker : Bool = false
    @State private var image : Image? = Image("profile")
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var mobileNumber: String = ""
    @State private var address: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            image?.resizable().frame(width: 100, height: 100, alignment: .center)
                .overlay(RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.orange, lineWidth: 4))
                .shadow(radius: 10).onTapGesture {
                self.showImagePicker = true
            }.sheet(isPresented: self.$showImagePicker){
                PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image)
            }.clipShape(Circle())
            TextField("First Name", text: $firstName).padding(.leading,10).frame(height: 40).border(Color.gray)
            TextField("Last Name", text: $lastName).padding(.leading,10).frame(height: 40).border(Color.gray)
            TextField("Mobile Number", text: $mobileNumber).padding(.leading,10).frame(height: 40).border(Color.gray)
            TextField("Address", text: $address).padding(.leading,10).frame(height: 40).border(Color.gray)
            TextField("Username", text: $username).padding(.leading,10).frame(height: 40).border(Color.gray)
            SecureField("Password", text: $password).padding(.leading,10).frame(height: 40).border(Color.gray)
            SecureField("Confirm Password", text: $confirmPassword).padding(.leading,10).frame(height: 40).border(Color.gray)
            Button(action: {
                print("Sign In")
               
            }) {
                NavigationLink(destination: SigmaHomeView().navigationTitle("").navigationBarHidden(true)) {
                    Text("Submit")
                        .font(.headline)
                        .foregroundColor(.white)
                    .navigationBarTitle("")
                    .navigationBarHidden(false)
                }
            }.padding(.leading,50).padding(.trailing,50).frame(height: 50, alignment: .center).background(Color.black).listItemTint(Color.white).foregroundColor(Color.white).cornerRadius(10)

            
        }).padding(.leading,50).padding(.trailing,50)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

struct ImagePicker : UIViewControllerRepresentable {
    
    @Binding var isShown    : Bool
    @Binding var image      : Image?
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    func makeCoordinator() -> ImagePickerCordinator {
        return ImagePickerCordinator(isShown: $isShown, image: $image)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
}

class ImagePickerCordinator : NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    @Binding var isShown    : Bool
    @Binding var image      : Image?
    
    init(isShown : Binding<Bool>, image: Binding<Image?>) {
        _isShown = isShown
        _image   = image
    }
    
    //Selected Image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        image = Image(uiImage: uiImage)
        isShown = false
    }
    
    //Image selection got cancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
}
struct PhotoCaptureView: View {
    
    @Binding var showImagePicker    : Bool
    @Binding var image              : Image?
    
    var body: some View {
        ImagePicker(isShown: $showImagePicker, image: $image)
    }
}

struct PhotoCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCaptureView(showImagePicker: .constant(false), image: .constant(Image("")))
    }
}
