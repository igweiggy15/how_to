//
//  ViewController.swift
//  IOS-Swift-HowTo
//
//  Created by Igwe Onumah on 1/23/20.
//  Copyright © 2020 Igwe Onumah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView : UICollectionView!
    var colectionArr : [String] = ["1","2","3","4"]    
    let titlesF = [("iphone6"), ("iphone7"), ("iphone7plus"), ("iphone8"), ("iphone8plus"), ("iphoneX"), ("iphoneXS"), ("iphoneXSmax"), ("iphoneXR"), ("iphone11"), ("iphone11pro"), ("iphone11proMax")]
    let desF = [("The iPhone 6 is a smartphone designed and marketed by Apple Inc. It is the eighth generation of the iPhone, succeeding the iPhone 5S, and was announced on September 9, 2014 and released on September 19, 2014. The iPhone 6 include larger 4.7 inches (120 mm) displays, a faster processor, upgraded cameras, improved LTE and Wi-Fi connectivity and support for a near field communications-based mobile payments offering."), ("Apple iPhone 7 is powered by a 2.34GHz quad-core Apple A10 Fusion processor. It comes with 2GB of RAM. The Apple iPhone 7 runs iOS 10 and is powered by a 1960mAh non-removable battery. As far as the cameras are concerned, the Apple iPhone 7 on the rear packs a 12-megapixel camera with an f/1.8 aperture."), ("Apple iPhone 7 Plus smartphone was launched in September 2016. The phone comes with a 5.50-inch touchscreen display with a resolution of 1080x1920 pixels at a pixel density of 401 pixels per inch (ppi). Apple iPhone 7 Plus is powered by a quad-core Apple A10 Fusion processor. It comes with 3GB of RAM."), ("The iPhone 8 features a 4.7-inch display with a resolution of 1334 by 750 with 326 pixels per inch and a 1400:1 contrast ratio, while the iPhone 8 Plus features a 5.5-inch display with a 1920 by 1080 resolution, 401 pixels per inch, and a 1300:1 contrast ratio."), ("The Apple iPhone 8 Plus is a smartphone that was tested with the iOS 11 operating system. This model weighs 7.2 ounces, has a 5.5 inch touch screen display, 12-megapixel main camera, and 7-megapixel selfie camera. It comes with 3GB of RAM. It was tested with 64GB of storage."), ("The phone comes with a 5.80-inch touchscreen display with a resolution of 1125x2436 pixels at a pixel density of 458 pixels per inch (ppi) and an aspect ratio of 19.5:9. Apple iPhone X is powered by a 2.39GHz hexa-core Apple A11 Bionic processor. It comes with 3GB of RAM."), ("It is power-driven by Hexa Core (2.35 GHz, Dual-core, Monsoon + 1.42 GHz, Quad core, Mistral) processor along with a RAM of 4 GB. This iPhoneXS is expected to include an improvised USB-C to a lightning cable that ensures faster charging."), ("Apple iPhone XS Max boasts of 6.5 inches (16.51 cm) super retina display with a resolution of 1242 x 2688 pixels. It features an OLED screen having an aspect ratio of 19.5:9 and pixel density of 456 PPI. The phone weighs 208 grams and is 7.7 mm thick with a height of 157.5 mm."), ("The phone comes with a 6.10-inch touchscreen display with a resolution of 828x1792 pixels at a pixel density of 326 pixels per inch (ppi) and an aspect ratio of 19.5:9. Apple iPhone XR is powered by a hexa-core Apple A12 Bionic processor. It comes with 3GB of RAM."), ("With its 6.1-inch display, the iPhone 11 is between the 5.8-inch iPhone 11 Pro and 6.5-inch iPhone 11 Pro Max in size. ... The iPhone 11 measures in at 150.9mm tall, 75.7mm wide, and 8.3mm thick, which is identical to the previous-generation iPhone XR. It weighs in at 6.84 ounces, also identical to the XR."), ("The iPhone 11 Pro, which has a 5.8-inch display, features a resolution of 2436 x 1125 at 458 ppi, while the 6.5-inch iPhone 11 Pro Max features a resolution of 2688 x 1242 at 458 ppi. Apple's newest display is 15 percent more power efficient, which contributes to some impressive battery life gains in the iPhone 11 Pro."), ("The iPhone 11 Pro Max has an A13 Bionic processor. It has three internal storage options: 64 GB, 256 GB, and 512 GB, and have 4 GB of RAM. It is rated IP68 water and dust resistant, and are resistant for 30 minutes at a depth of 4 meters.")]
    let imagesF = [ UIImage(named: "iphone6"),
                    UIImage(named: "iphone7"),
                    UIImage(named: "iphone7plus"),
                    UIImage(named: "iphone8"),
                    UIImage(named: "iphone8plus"),
                    UIImage(named: "iphoneX"),
                    UIImage(named: "iphoneXS"),
                    UIImage(named: "iphoneXSmax"),
                    UIImage(named: "iphoneXR"),
                    UIImage(named: "iphone11"),
                    UIImage(named: "iphone11pro"),
                    UIImage(named: "iphone11proMax")]
    
    
    // multiple number to creat font size based on device screen size
    let relativeFontWelcomeTitle:CGFloat = 0.045
    let relativeFontButton:CGFloat = 0.060
    let relativeFontCellTitle:CGFloat = 0.010
    let relativeFontCellDescription:CGFloat = 0.007

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delegate and dataSource
        collectionView.delegate = self
        collectionView.dataSource = self
//        collectionView.backgroundColor = UIColor.green
        
    }


    // UICollectionViewDelegate, UICollectionViewDataSource functions
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titlesF.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
    
        //let thisElement = colectionArr[indexPath.item]
        let cellIndex = indexPath.item
        let closeFrameSize = bestFrameSize()

        cell.editImg.isHidden = true
        cell.trashImg.isHidden = true
        
        cell.imageCell.image = imagesF[cellIndex]
        cell.labelTitle.text = titlesF[cellIndex]
        cell.labelTitle.font = cell.labelTitle.font.withSize(closeFrameSize * relativeFontCellTitle)
        cell.labelDetails.text =  desF[cellIndex]
        cell.labelDetails.font = cell.labelDetails.font.withSize(closeFrameSize * relativeFontCellDescription)
        
        
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.borderWidth = 1.0
        
        
        cell.contentView.layer.borderColor = UIColor.blue.cgColor
        cell.contentView.layer.masksToBounds = true
        cell.backgroundColor = UIColor.white

        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        
        
        
        return cell
    }
   
    
    func bestFrameSize() -> CGFloat {
        let frameHeight = self.view.frame.height
        let frameWidth = self.view.frame.width
        let bestFrameSize = (frameHeight > frameWidth ) ? frameHeight : frameWidth
        
        return bestFrameSize
    }
    
}



// extention for UICollectionViewDelegateFlowLayout
extension ViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        let heightVal = self.view.frame.height
        let widthVal = self.view.frame.width
        let cellsize = (heightVal < widthVal) ?  bounds.height/2 : bounds.width/2
        
        return CGSize(width: cellsize - 10   , height:  cellsize - 10  )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}//end of extension  ViewController
