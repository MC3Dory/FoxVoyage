//
//  GalleryAccessView.swift
//  FoxVoyage
//
//  Created by Rahmi Umarefi on 20/07/23.
//

import SwiftUI
import Photos

struct GalleryAccessView: View {
    @State private var isGalleryAccessGranted = false
    
    var body: some View {
        VStack{
            HStack{
                Text("Immerse yourself")
                    .font(.custom("SFProDisplay-Regular", size: 34))
                Text("in the")
                    .foregroundColor(Color("Black200"))
                    .font(.custom("SFProDisplay-Regular", size: 34))
            }
            .frame(maxWidth: 355, alignment: .leading)
            .padding(.top)
            
            
            Text("complete experience")
                .font(.custom("SFProDisplay-Regular", size: 34))
                .frame(maxWidth: 355, alignment: .leading)
            
            HStack{
                Text("allow acces")
                    .font(.custom("SFProDisplay-Regular", size: 34))
                Text("to the")
                    .foregroundColor(Color("Black200"))
                    .font(.custom("SFProDisplay-Regular", size: 34))
            }
            .frame(maxWidth: 355, alignment: .leading)
            
            Text("gallery")
                .font(.custom("SFProDisplay-Regular", size: 34))
                .frame(maxWidth: 355, alignment: .leading)
            
            
            
            
            Image("galleryAccess")
                .padding(.top,15)
            Text("Let's explore your gallery together! Allow access to preserve your travel memories beautifully")
                .font(.custom("SFProText-Regular", size: 17))
                .frame(maxWidth: 360, alignment: .leading)
                .padding(.top, 20)
            
            Spacer()
            Button("Give Access") {
                requestGalleryAccess { isGranted in
                    isGalleryAccessGranted = isGranted
                }
            }
            .foregroundColor(.white)
            .frame(width: 358, height: 64, alignment: .center)
            .background(Color("Redish400"))
            .cornerRadius(999)
            .padding(.top, 2)
            
            NavigationLink(
                destination: InformationNameView(), // Replace "NextView()" with the view you want to navigate to
                isActive: $isGalleryAccessGranted,
                label: { EmptyView() }
            )
            .hidden()
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        
        
    }
    
    func requestGalleryAccess(completion: @escaping (Bool) -> Void) {
        PHPhotoLibrary.requestAuthorization { status in
            DispatchQueue.main.async {
                switch status {
                case .authorized:
                    // Gallery access granted
                    completion(true)
                case .denied, .restricted:
                    // Gallery access denied or restricted
                    completion(false)
                case .notDetermined:
                    // Shouldn't happen, but handle it anyway
                    completion(false)
                @unknown default:
                    // Handle any future cases (unlikely)
                    completion(false)
                }
            }
        }
    }
}

struct GalleryAccessView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryAccessView()
    }
}
