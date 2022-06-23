//
//  CollectionViewController.swift
//  FirstApplication
//
//  Created by 이형진 on 2022/06/23.
//

import UIKit

class CollectionViewController: UIViewController,UICollectionViewDataSource {
    var array:[String]=[]

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        print(array)
    }
    

}
