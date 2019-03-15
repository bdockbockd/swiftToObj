//
//  TableViewController.swift
//  swiftToObejctive
//
//  Created by B2B on 15/3/2562 BE.
//  Copyright © 2562 BB. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var table: UITableView!
    static var type : String?
    static var info : String?
    
    static var contentArr : [String : Any]?{
        didSet{
            print("is being set")
//            print(type)
//            print(info)
            if let contentArr = contentArr{
                for (x,y) in contentArr  {
//                    if let x = x , let y =y {
                        print(x,y)
//                    }
                }
            }
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)

        }
    }
    
    @objc func loadList(notification: NSNotification){
        //load data here
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.delegate = self
        self.table.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//        for (x,y) in contentArr! {
//            print("\(x) \(y)")
//        }
    }
    

    // MARK: - Table view data source
//    function reloadData(){
//        self.t
//    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ["TYPE", "INFO", "CONTENT"]
    }
    
//    func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0) {
            return "TYPE"
        } else if (section == 1) {
            return "INFO"
        } else {
            return "CONTENT"
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(section == 2) {
            if let co = TableViewController.contentArr?.count {
                return co
            } else {
                return 1
            }
        } else {
            return 1
        }
        
    }
    
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "typeData")
            if let tex = TableViewController.type {
                cell?.textLabel?.text = tex
            } else {
                cell?.textLabel?.text = "NO TYPE"
            }
            return cell!
        } else if(indexPath.section == 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoData")
            if let tex = TableViewController.info {
                cell?.textLabel?.text = tex
            } else {
                cell?.textLabel?.text = "NO INFO"
            }
            return cell!
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "contentData", for: indexPath)
            var x : String
            switch indexPath.row {
            case 0:
                if let tex = TableViewController.contentArr?["studentid"] {
                    x = "ID : \(tex)"
                    cell.textLabel?.text = x
                }
            case 1:
                if let tex = TableViewController.contentArr?["name_th"] {
                    x = "Name_TH : \(tex)"
                    cell.textLabel?.text = x
                }
            case 2:
                if let tex = TableViewController.contentArr?["name_en"] {
                    x = "Name_EN : \(tex)"
                    cell.textLabel?.text = x
                }
            case 3:
                if let tex = TableViewController.contentArr?["faculty"] {
                    x = "Faculty : \(tex)"
                    cell.textLabel?.text = x
                }
            case 4:
                if let tex = TableViewController.contentArr?["email"] {
                    x = "EMAIL : \(tex)"
                    cell.textLabel?.text = x
                }
            case 5:
                if let tex = TableViewController.contentArr?["gender"] {
                    x = "Gender : \(tex)"
                    cell.textLabel?.text = x
                }
//            case 6:
//            case 7:
            default:
                x = "NO CONTENT"
                cell.textLabel?.text = x

            }
            return cell;
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
