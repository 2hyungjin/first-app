//
//  CollectionViewController.swift
//  FirstApplication
//
//  Created by 이형진 on 2022/06/23.
//

import UIKit

class CollectionViewController: UIViewController,UICollectionViewDataSource {
    var array:[String]=[]
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell:CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else{
            return UICollectionViewCell()
        }
        cell.indexLabel.text = String(indexPath.item)
        cell.contentLabel.text = array[indexPath.item]
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        print(array)
    }
    
    @IBAction func touchUpAddButton(_ sender: UIButton){
        array.append("A")
        collectionView.reloadData()
        
    }
}
