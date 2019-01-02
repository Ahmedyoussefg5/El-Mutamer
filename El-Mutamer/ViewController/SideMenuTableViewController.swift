//
//  SideMenuTableViewController.swift
//  Tanta Services
//
//  Created by Youssef on 11/22/18.
//  Copyright © 2018 Tantaservices. All rights reserved.
//

import UIKit
class SideMenuTableViewController: UITableViewController {
        
    func tableConfiger() {
        tableView.backgroundColor = #colorLiteral(red: 0.9998950362, green: 1, blue: 0.9998714328, alpha: 1)
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

        tableConfiger()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)

    }

    let tableViewItems = ["الرئسية", "الاعدادات", "استكشف", "اتصل بنا", "تسجيل خروج"]
    let imgArray = [UIImage(named: "home"), UIImage(named: "settingsetting"), UIImage(named: "settingsetting"), UIImage(named: "settingsetting"), UIImage(named: "onn")]
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableViewItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sideMenuCell", for: indexPath)
        cell.backgroundColor = #colorLiteral(red: 0.9998950362, green: 1, blue: 0.9998714328, alpha: 1)
        cell.textLabel?.text = tableViewItems[indexPath.row]
        cell.textLabel?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cell.textLabel?.font = UIFont.CairoSemiBold(of: 15)
        cell.textLabel?.textAlignment = .right
        
        let imgView = UIImageView(frame: .init(x: 0, y: 0, width: 30, height: 30))
        cell.addSubview(imgView)
        imgView.anchorWithCenterXY(top: nil, leading: cell.leadingAnchor, bottom: nil, trailing: nil, centerX: nil, centerY: cell.centerYAnchor, padding: .init(top: 0, left: 8, bottom: 0, right: 0))
        imgView.image = imgArray[indexPath.row]
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
            let contactUs = CallUsViewController()
            navigationController?.pushViewController(contactUs, animated: true)
        case 4:
            AuthService.instance.restartAppAndRemoveUserDefaults()
        case 5: break
          //  present(ContactUsViewController(), animated: true, completion: nil)
        default:
            return
        }
    }
    


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
