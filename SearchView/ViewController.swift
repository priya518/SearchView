//
//  ViewController.swift
//  SearchView
//
//  Created by Priya Patel on 30/12/19.
//  Copyright © 2019 priya. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , UISearchBarDelegate{
    
    //Step 3
    var searcharr = [String]()
    var searching = false
    
    //Step 1 outlate of tableview & searchbar
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var tblview: UITableView!
    
    //Step 2 Declaring an array
    var arr = ["Arzoo","Avi","Bhoomi","Bhavesh","Charmi","Chandler","Dhruv","Erica","Fenali","Fairy","Geeta","Gauri","Hemil","Heli","Ishani","Jay","Jinal","Kajal","Ketan","Lisa","Love","Mansi","Meha","Niya","Nilraj","Nikunj","Priya","Primal","Qury","Rihan","Rishi","Siddharth","Shivani","Twinkle","Tina","Urvashi","Uday","Vraj","Vihan","Yogesh","Vijay"]
    
    //Step 4
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searching
        {
            return searcharr.count
        }
        else
        {
            return arr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if searching
        {
            cell.textLabel?.text = searcharr[indexPath.row]
        }else
        {
            cell.textLabel?.text = self.arr[indexPath.row]
        }
        
        return cell
    }
    
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
       }
    

       // Step 5 For serching an element of array
       func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
        {
            searcharr = arr.filter({$0.prefix(searchText.count) == searchText})
            searching = true
            tblview.reloadData()
        }
    // Step 6 For cancle button
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tblview.reloadData()
    }
        
        
        
        
    
    
   


}

