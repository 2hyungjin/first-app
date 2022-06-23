//
//  SecondViewController.swift
//  FirstApplication
//
//  Created by 이형진 on 2022/06/19.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tabelView: UITableView!
    let cellIdentifier:String = "cell"
    let customCellIdentifier:String = "customCell"
    
    let korean:[String] = ["가","나","다","라","마","바","사","아","자","차","카","타","파","하"]
    let english:[String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    var array:[String] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return korean.count
        case 1:
            return english.count
        default:
            return array.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section < 2{
            let cell : UITableViewCell = tabelView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            let text : String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
            cell.textLabel?.text = text
            return cell
        }else{
            let cell : CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: customCellIdentifier, for: indexPath) as! CustomTableViewCell
            cell.leftLabel?.text = String(indexPath.row)
            cell.rightLabel?.text = array[indexPath.row]
            return cell
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section==2{
            return nil
        }
        return section == 0 ? "한글" : "영어"
    }
    
    
    @IBAction func touchUpAddButton(_ sender: Any) {
        array.append("a")
        tabelView.reloadSections(IndexSet(2...2), with: UITableView.RowAnimation.automatic)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func popNaviagion(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func touchUpRefeshButton(_ sender: UIBarButtonItem){
        array.removeAll()
        self.tabelView.reloadSections(IndexSet(2...2), with: UITableView.RowAnimation.automatic)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController : DetailViewController = segue.destination as? DetailViewController else{return}
        guard let cell : UITableViewCell = sender as? UITableViewCell else {return}
        
        nextViewController.text = cell.textLabel?.text
    }

    
    
}
