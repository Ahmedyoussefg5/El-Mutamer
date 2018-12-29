//
//  SideMenuTableViewController.swift
//  Tanta Services
//
//  Created by Youssef on 11/22/18.
//  Copyright © 2018 Tantaservices. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

 //   var menusArray = [Menu]()
    var schedules = [Schedule]()
    
    func tableConfiger() {
        
        tableView.backgroundColor = .white
        tableView.isOpaque = false
        tableView.backgroundView = nil
        //tableView.tableFooterView = UIView()
        tableView.separatorInset = .init(top: 10, left: 5, bottom: 10, right: 5)
        tableView.contentInset = .zero
        tableView.separatorColor = .white
        tableView.register(MenuCell.self, forCellReuseIdentifier: "MenuCell")
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableConfiger()
        
    }

    init(data: [Schedule]) {
        super.init(nibName: nil, bundle: nil)
        self.schedules = data
        tableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedules.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        cell.setupData(data: schedules[indexPath.row])
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


class MenuCell: UITableViewCell {

    let headLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .white
        lable.font = UIFont.CairoSemiBold(of: 17)
        lable.textAlignment = .right
        lable.text = "title"
        lable.textColor = .black
        return lable
    }()
    let bodyLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .white
        lable.font = UIFont.CairoSemiBold(of: 16)
        lable.numberOfLines = 0
        lable.text = "asdasd asd as da sd as da sd a sdafsada sad ds efas f dfs"
        lable.textAlignment = .right
        lable.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3773544521)
        //lable.text = title
        return lable
    }()
    let purpleView: UIView = {
        let lable = UIView()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.backgroundColor = #colorLiteral(red: 0.8780626655, green: 0.2536518276, blue: 0.2472576201, alpha: 1)
        lable.layer.cornerRadius = 5
        return lable
    }()

    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = #colorLiteral(red: 0.9141605496, green: 0.9214834571, blue: 0.9301630855, alpha: 1)
        
        setupCell()
        
    }
    
    fileprivate func setupCell() {
        contentView.addSubview(purpleView)
        purpleView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: 5, left: 10, bottom: 0, right: 5), size: .init(width: contentView.frame.width, height: 30))

        purpleView.addSubview(headLable)
        headLable.anchorWithCenterXY(top: nil, leading: nil, bottom: nil, trailing: nil, centerX: purpleView.centerXAnchor, centerY: purpleView.centerYAnchor)
        
        contentView.addSubview(bodyLable)
        bodyLable.anchorWithCenterXY(top: purpleView.bottomAnchor, leading: nil, bottom: contentView.bottomAnchor, trailing: nil, centerX: contentView.centerXAnchor, centerY: nil, padding: .init(top: 7, left: 0, bottom: 0, right: 0), size: .init(width: contentView.frame.width * 0.9, height: 0))
    }
    
    func setupData(data: Schedule) {
        if let head = data.title {
            headLable.text = head
        }
        if let body = data.content {
            bodyLable.text = body
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




















