//
//  CollectionViewswift
//  IOS-Swift-HowTo
//
//  Created by Igwe Onumah on 1/23/20.
//  Copyright © 2020 Igwe Onumah. All rights reserved.
//

import UIKit

protocol DataCollectionProtocol {
    func passData(index : Int)
    func deleteData(index : Int)
}

class CollectionViewCell: UICollectionViewCell {
    
    var index : IndexPath?
    var delegate : DataCollectionProtocol?
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDetails: UILabel!
    @IBOutlet weak var trashImg: UIButton!
    @IBOutlet weak var editImg: UIButton!
    
    @IBAction func editBtn(_ sender: UIButton) {
        delegate?.passData(index: (index?.row)!)
    }
    
    @IBAction func deleteBtn(_ sender: UIButton) {
        delegate?.deleteData(index: (index?.row)!)
    }

}
