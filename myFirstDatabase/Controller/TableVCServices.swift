//
//  TableViewControllerForServices.swift
//  DoForMe
//
//  Created by Артём Бацанов on 08.06.2020.
//  Copyright © 2020 Артём Бацанов. All rights reserved.
//

import UIKit

class TableVCServices: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideNavigationBar()

        tableView.tableFooterView = UIView()
    }
    
    func hideNavigationBar() {
        navigationItem.largeTitleDisplayMode = .never
    }
    
    @IBAction func pushBtnEdit(_ sender: Any) {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    
    @IBAction func addBtn(_ sender: Any) {
        
         let alertController = UIAlertController(title: "Название услуги", message: nil, preferredStyle: .alert)
          
          alertController.addTextField { (textField) in
              textField.placeholder = "Введите название услуги"
          }
          
          let alertAction1 = UIAlertAction(title: "Отменить", style: .default) { (alert) in }
          
          let alertAction2 = UIAlertAction(title: "Ок", style: .cancel) { (alert) in
            
              let newItem = alertController.textFields![0].text
            
             if newItem == "" {
                  let alertErrorEmpty = UIAlertController(title: "Ошибка", message: "Заполните поле!", preferredStyle: .alert)
                  alertErrorEmpty.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                  self.present(alertErrorEmpty, animated: true, completion: nil)
              }
              else {
                  addItemServices(nameItem: newItem!)
                  self.tableView.reloadData()
              }
          }
          
          alertController.addAction(alertAction1)
          alertController.addAction(alertAction2)
          
          present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(label["Name"] ?? "")
        let cellIndex = indexPath.row // index of selected cell
        let intCell = funcId(index: cellIndex) //Возвращает int индекс ячейки
        let nameOfCell = Services[intCell] // имя ячейки
        let alert = UIAlertController(title: nameOfCell["Name"] as? String , message: nil, preferredStyle: UIAlertController.Style.alert)
        
        if nameOfCell["Name"] as? String == "Стрижка" || nameOfCell["Name"] as? String == "стрижка" {
            alert.message = " Модельная - 399 руб" + "\nПод 0, 0.1, 0.6 - 150 руб" + "\nПенсионерам - 99 руб"
        }
        
        if nameOfCell["Name"] as? String == "Массаж" || nameOfCell["Name"] as? String == "массаж" {
            alert.message = " Расслабляющая - 499 руб" + "\nВосстанавливающий - 599 руб" + "\nТайский - 399 руб"
        }
        
        if nameOfCell["Name"] as? String == "Маникюр" || nameOfCell["Name"] as? String == "маникюр" {
            alert.message = "от 399 руб"
        }
        
        if nameOfCell["Name"] as? String == "Педикюр" || nameOfCell["Name"] as? String == "педикюр" {
            alert.message = "от 399 руб"
        }
        
        let alertAction1 = UIAlertAction(title: "Ок", style: .default) { (alert) in }
        
        let alertAction2 = UIAlertAction(title: "Мастера", style: .cancel) { (alert) in
            let secondViewController = self.storyboard!.instantiateViewController(withIdentifier: "mastersController") as UIViewController
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
        
        alert.addAction(alertAction1)
        alert.addAction(alertAction2)
        
        present(alert, animated: true, completion: nil)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Services.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)
        
        
        cell.backgroundColor = UIColor.systemYellow
        cell.textLabel?.font = UIFont(name: "Avenir", size: 23)
        
        
        let currentItem = Services[indexPath.row]
        cell.textLabel?.text = currentItem["Name"] as? String
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let degree: Double = 90
        let rotationAngle = CGFloat(degree * .pi / 180)
        let rotationTransform = CATransform3DMakeRotation(rotationAngle, 1, 0, 0)
        cell.layer.transform = rotationTransform
        
        UIView.animate(withDuration: 1, delay: 0.2 * Double(indexPath.row), options: .curveEaseInOut, animations: {
            cell.layer.transform = CATransform3DIdentity
        })
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
             // Delete the row from the data source
             removeItemServices(at: indexPath.row)
             tableView.deleteRows(at: [indexPath], with: .fade)
         } else if editingStyle == .insert {
             // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }
     }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

        moveItem(fromIndex: fromIndexPath.row, toIndex: to.row)
        
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if tableView.isEditing{
            return .none
        }
        else{
            return .delete
        }
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }


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
