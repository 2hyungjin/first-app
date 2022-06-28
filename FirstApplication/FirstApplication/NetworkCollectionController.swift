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
        if let imageURL:URL = URL(string: friend.picture.thumbnail){
            guard let imageData:Data = try? Data(contentsOf: imageURL) else {return cell}
            cell.image.image = UIImage(data: imageData)
        }
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let url:URL = URL(string : "https://randomuser.me/api/?results=20&inc=name,email,picture") else {return}
        
        let session : URLSession = URLSession(configuration: .default)
        
        let dataTask : URLSessionDataTask = session.dataTask(with: url) { (data:Data?, response:URLResponse?, error:Error?) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else{return}
            print("data: \(data)")
            
            do{
                let apiResponse:APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                self.friends=apiResponse.results
                self.collectionView.reloadData()
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }
        }
        
        dataTask.resume() 
            
    }
    
}
