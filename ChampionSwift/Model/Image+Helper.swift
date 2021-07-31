//
//  ImageView.swift
//  ChampionSwift
//
//  Created by saeed on 7/28/21.
//
import SwiftUI

extension Image {

    static func contents(of url: URL) -> Image {
        
        do {

            let data: Data = try Data(contentsOf: url)
//            return Image(uiImage:  UIImage(data: data) ?? UIImage())
            if let uiimage =  UIImage(data: data) {
                return Image(uiImage: uiimage)
            }
                
            
        } catch let error {
            print(error)
        }
        return Image(systemName: "photo")
        
    }

    
}


//extension URL {
//    func fromUrl() -> UIImage {
//        do {
//            
//            let data: Data = try Data(contentsOf: self)
//            return UIImage(data: data) ?? UIImage()
//        } catch let error {
//            print(error)
//        }
//        return UIImage(systemName: "photo") ?? UIImage()
//        
//    }
//    
//}
