//
//  TableViewControllerForSalons.swift
//  myFirstDatabase
//
//  Created by Артём Бацанов on 24.04.2020.
//  Copyright © 2020 Артём Бацанов. All rights reserved.
//

import UIKit
import Firebase

class TableVCSalons: UITableViewController {

    @IBAction func pushAddSalon(_ sender: Any) {
        
       let alertController = UIAlertController(title: "Название салона", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Введите название салона"
        }
        
        let alertAction1 = UIAlertAction(title: "Отменить", style: .default) { (alert) in
            
        }
        
        let alertAction2 = UIAlertAction(title: "Ок", style: .cancel) { (alert) in
            
            let newItem = alertController.textFields![0].text
            
            if newItem == "" {
                let alertErrorEmpty = UIAlertController(title: "Ошибка", message: "Заполните поле!", preferredStyle: .alert)
                alertErrorEmpty.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertErrorEmpty, animated: true, completion: nil)
            }
                
            else {
                addItem(nameItem: newItem!)
                self.tableView.reloadData()
            }
        }
            
            alertController.addAction(alertAction1)
            alertController.addAction(alertAction2)
            
            present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        //tableView.backgroundColor = UIColor.systemGray5
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Salons.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let num = Int.random(in: 0 ..< 3)
         
        switch num {
//        case 0:
//            //print("Переменная равна", num)
//            cell.backgroundColor = UIColor.systemGray3
//        case 1:
//            //print("Переменная равна", num)
//            cell.backgroundColor = UIColor.systemRed
        case 0:
            //print("Переменная равна", num)
            cell.backgroundColor = UIColor.systemBlue
        case 1:
            //print("Переменная равна", num)
            cell.backgroundColor = UIColor.systemPink
        case 2:
            //print("Переменная равна", num)
            cell.backgroundColor = UIColor.systemGreen
//        case 5:
//            //print("Переменная равна", num)
//            cell.backgroundColor = UIColor.systemYellow
        default:
            print("не удалось распознать число")
        }
       // cell.textLabel? = UIFont.boldSystemFont(ofSize: 18)
        
            //cell.backgroundColor = UIColor.systemGray3
        
        //cell.backgroundColor = UIColor.systemGray3
        
        let currentItem = Salons[indexPath.row]
        cell.textLabel?.text = currentItem["Name"] as? String
        //cell.textLabel?.text = Salons[indexPath.row]
        return cell
    }
    
 // Override to support editing the table view.
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
          // Delete the row from the data source
          removeItem(at: indexPath.row)
          tableView.deleteRows(at: [indexPath], with: .fade)
      } else if editingStyle == .insert {
          // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
      }
  }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
    

    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }

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
