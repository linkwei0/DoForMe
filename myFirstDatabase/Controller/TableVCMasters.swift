//
//  TableVCForMasters.swift
//  DoForMe
//
//  Created by Артём Бацанов on 12.06.2020.
//  Copyright © 2020 Артём Бацанов. All rights reserved.
//

import UIKit

class TableVCMasters: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        
        tableView.tableFooterView = UIView()
    }
    
    func setupNavBar() {
           navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
           navigationController?.navigationBar.shadowImage = UIImage()
           navigationController?.navigationBar.tintColor = .white
       }

    @IBAction func btnAddMaster(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Мастер", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Введите имя и фамилию мастера"
        }
        
        let alertAction1 = UIAlertAction(title: "Отменить", style: .default) { (alert) in }
        
        let alertAction2 = UIAlertAction(title: "Ок", style: .cancel) { (alert) in
            
            let newItem = alertController.textFields![0].text!
            
            if newItem == "" {
                let alertErrorEmpty = UIAlertController(title: "Ошибка", message: "Заполните поле!", preferredStyle: .alert)
                alertErrorEmpty.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertErrorEmpty, animated: true, completion: nil)
            }
                
            else {
                addItemMaster(nameItem: newItem)
                self.tableView.reloadData()
            }
        }
        
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Masters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellMaster", for: indexPath)
        
        
        cell.backgroundColor = UIColor.systemBlue
        cell.textLabel?.font = UIFont(name: "Avenir", size: 22)
        //cell.tintColor = UIColor.systemBlue
        
        
        cell.textLabel?.text = Masters[indexPath.row]
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
