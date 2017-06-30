//
//  ViewController.swift
//  TableView
//
//  Created by 王博 on 17/5/24.
//  Copyright © 2017年 NewsInPalm. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    lazy var models: [Model] = {
        var models = [Model]()
        
        for i in 0..<9 {
            let model = Model()
            model.contentStr = "第\(i)行"
            model.url = "http://baidu.com"
            models.append(model)
        }
        
        return models
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        register()
        tableView.rowHeight = 100
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController {
    func register()  {
        tableView.register(UINib(nibName: "VideoCell", bundle: nil), forCellReuseIdentifier: "CellID")
    }
}


extension ViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID") as! VideoCell
        cell.model = models[indexPath.row]
        return cell
    }
    
}
