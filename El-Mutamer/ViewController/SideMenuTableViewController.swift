//
//  SideMenuTableViewController.swift
//  Tanta Services
//
//  Created by Youssef on 11/22/18.
//  Copyright © 2018 Tantaservices. All rights reserved.
//

import UIKit

//protocol Select


class SideMenuTableViewController: UITableViewController {
        
    func tableConfiger() {
        
        tableView.backgroundColor = #colorLiteral(red: 0.4352941176, green: 0.231372549, blue: 0.5843137255, alpha: 1)
        tableView.isOpaque = false
        tableView.backgroundView = nil
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero
        tableView.separatorColor = .clear
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "sideMenuCell")
        //tableMain.dataSource = self
        //tableMain.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableConfiger()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)

    }

    let tableViewItems = ["الرئسية", "استكشاف", "اضف شركتك", "الاحتفالات والندوات", "الشروط والقوانين", "تواصل معنا"]
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableViewItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sideMenuCell", for: indexPath)
        cell.backgroundColor = #colorLiteral(red: 0.4352941176, green: 0.231372549, blue: 0.5843137255, alpha: 1)
        cell.textLabel?.text = tableViewItems[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.CairoSemiBold(of: 17)
        cell.textLabel?.textAlignment = .right
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            dismiss(animated: true, completion: nil)
          //  NotificationCenter.default.post(name: toHomeVC, object: nil)
        case 1:
            dismiss(animated: true, completion: nil)
           // NotificationCenter.default.post(name: toExplorVC, object: nil)
        case 2:
            dismiss(animated: true, completion: nil)
           // NotificationCenter.default.post(name: toAddCompanyVC, object: nil)
        case 3:
            return
        case 4:
            return
        case 5: break
          //  present(ContactUsViewController(), animated: true, completion: nil)
        default:
            return
        }
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
