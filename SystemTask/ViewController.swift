//
//  ViewController.swift
//  SystemTask
//
//  Created by THOTA NAGARAJU on 1/27/20.
//  Copyright © 2020 THOTA NAGARAJU. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    // Creating Variables
    
    @IBOutlet weak var tableView: UITableView!
    
    var items = ["America","India","Indonesia","Iran","Russia","Japan","Kanada","Italy"]
    var shuffledArrayIndex = [Int]()
    var selectedArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    
    }
    
    // IB action Button to Display Data
    @IBAction func actionButton(_ sender: Any) {
        
        for (item,_) in selectedArray.enumerated() {
            let temp = items[item]
            items[item] = selectedArray[item]
            let indexObject = self.shuffledArrayIndex[item]
            items[indexObject] = temp
        }
        selectedArray = items.shuffled()
        isEditing = !isEditing
        self.tableView.reloadData()
        selectedArray.removeAll()
        shuffledArrayIndex.removeAll()
        
    }
    // Table View Delegate Functions
    
    // Table View NumberOfRowsInSection Delegate Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // Table View cellForRowAt indexPath Delegate Method
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.textLbl.text = items[indexPath.row]
        
        cell.accessoryType = .none
        return cell
    }
    
    // Table View didSelectRowAt indexPath Delegate Method
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .checkmark{
                cell.accessoryType = .none
                
            } else {
                cell.accessoryType = .checkmark
                self.selectedArray.append(self.items[indexPath.row])
                self.shuffledArrayIndex.append(indexPath.row)
                
            }
        }
    }
    
}
