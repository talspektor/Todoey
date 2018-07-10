//
//  ViewController.swift
//  Todoey
//
//  Created by user140592 on 7/9/18.
//  Copyright © 2018 talspektor. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArrray = [Item]()
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            
            itemArrray = items
        }
        
        let newItem = Item()
        newItem.title = "FindMike"
        itemArrray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "FindMike"
        itemArrray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "FindMike"
        itemArrray.append(newItem3)
        
        
    }
    
    
    
    //MARK - TableView Datasource Methods
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArrray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArrray[indexPath.row].title
        
        return cell
    }

    //MARK - TableView Delegate Methods
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //(itemArrray[indexPath.row])
        
        itemArrray[indexPath.row].done
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            print("Success")
            //what will happen once the user clicks the Add Item button on our UIAlert
           
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArrray.append(newItem)
            
            self.defaults.set(self.itemArrray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
       
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        
        
    }
    
}

