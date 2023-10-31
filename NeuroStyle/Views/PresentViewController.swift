//
//  PresentViewController.swift
//  NeuroStyle
//
//  Created by Hema Deva Sagar Potala on 9/1/23.
//

import UIKit

class PresentViewController: UIViewController {

    var selectedImage : UIImage?
    @IBOutlet weak var imageDisplay: UIImageView!
    let model = try? neuroV1()
    var styleImages = [UIImage(imageLiteralResourceName: "styleSeven"),
                       UIImage(imageLiteralResourceName: "style5"),
                       UIImage(imageLiteralResourceName: "style6"),
                       UIImage(imageLiteralResourceName: "style16"),
                       UIImage(imageLiteralResourceName: "style19"),
                       UIImage(imageLiteralResourceName: "style25")
     ]
   
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignImage()
//        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            print("yes")
//            print(layout.scrollDirection.rawValue)
//            layout.scrollDirection = .horizontal
//        }
        
//        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            print("yes")
//            print(layout.scrollDirection.rawValue)
//        }
        
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //TODO: - have an optional UIImage and present it on the view
        // Do any additional setup after loading the view.
    }
    
    func assignImage(){
        imageDisplay.image = selectedImage!
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - Collection view data source

extension PresentViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return styleImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("accessed how many times")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellToUse", for: indexPath) as! ImageCollectionViewCell
                
        cell.img.image = styleImages[indexPath.row]
        return cell
    }
    
    
}
// MARK: Collection view delegate

extension PresentViewController : UICollectionViewDelegate{
    
}

// MARK: Layout
extension PresentViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
//        print(height)
        return CGSize(width: height, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        print("does internspacing works")
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
