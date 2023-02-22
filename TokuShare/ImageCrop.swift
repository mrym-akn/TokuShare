//
//  ImageCrop.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/21.
//
import SwiftUI
import UIKit
import CropViewController

struct ImageCrop: UIViewControllerRepresentable{
    @Binding var image: UIImage?
    @Binding var visible: Bool
    
    class Coordinator: NSObject, CropViewControllerDelegate{
        let parent: ImageCrop
        
        init(_ parent: ImageCrop){
            self.parent = parent
        }
        
        func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
            self.parent.image = image
            withAnimation{
                self.parent.visible = false
            }
        }
        
        func cropViewController(_ cropViewController: CropViewController, didFinishCancelled cancelled: Bool) {
            withAnimation{
                parent.visible = false
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let img = self.image ?? UIImage()
        let cropViewController = CropViewController(croppingStyle: .default, image: img)
        cropViewController.delegate = context.coordinator
        return cropViewController
    }
}
