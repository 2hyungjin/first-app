//
//  TableViewController.swift
//  FirstApplication
//
//  Created by 이형진 on 2022/06/28.
//

import UIKit

class NetworkCollectionViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    let cellIdentifier: String = "cell"
    var friends:[Friend] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell : FriendCollectionViewCell =
                collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? FriendCollectionViewCell else{return UICollectionViewCell()}
        let friend = friends[indexPath.item]
        
        cell.email.text = friend.email
        cell.name.text = friend.name.first+friend.name.last
        cell.image.image = nil
        DispatchQueue.global().async {
            if let imageURL:URL = URL(string: friend.picture.thumbnail){
                guard let imageData:Data = try? Data(contentsOf: imageURL) else {return}
                
                DispatchQueue.main.async {
                    if let index : IndexPath = collectionView.indexPath(for: cell){
                        if index.row == indexPath.row{
                            cell.image.image = UIImage(data: imageData)
                        }
                    }
                }
            }
        }
        
        
        return cell
    }
    @objc func didRecieveFriendsNotification(_ noti: Notification){
        guard let friends:[Friend] = noti.userInfo?["friends"] as? [Friend] else {return}
        self.friends = friends
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.didRecieveFriendsNotification(_:)), name: DidReceiveFriendsNotification, object: nil )

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        requestFriends()
        
            
    }
    
}
