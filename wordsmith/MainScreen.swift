//
//  MainScreen.swift
//  wordsmith/Users/802781/Documents/wordsmith/wordsmith/MainScreen.swift
//
//  Created by KRUEGER, JOHN on 1/24/18.
//  Copyright © 2018 District196. All rights reserved.
//

import Foundation
import os.log

//This class contains our actual debate objects.
public class MainMenuData: NSObject {
    
    static var debates:[Debate] = []
    
}

import UIKit

class MainMenuTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    /*override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }*/
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return MainMenuData.debates.count
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "debateCell", for: indexPath)
        
     var localString = MainMenuData.debates[indexPath.row].otherTeam ?? "slytherine"
     localString.append(" ")
     localString.append(MainMenuData.debates[indexPath.row].tournament ?? "Hogwarts")
     
    cell.textLabel?.text? = localString
    
     return cell
     }
 
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Enables deletion of debates from the table.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            MainMenuData.debates.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    @IBAction func createDebate(_ sender: UIBarButtonItem) {
        let local = AppStoryboard.MainMenu.instance.instantiateViewController(withIdentifier: "CreateDebate")
        splitViewController?.showDetailViewController(local, sender: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

class DebateDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func modify(_ sender: Any) {
        
        let local = AppStoryboard.MainMenu.instance.instantiateViewController(withIdentifier: "ModifyDebate")
        
        splitViewController?.showDetailViewController(local, sender: nil)
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

class CreateDebateViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(_ sender: Any) {
        let local = AppStoryboard.MainMenu.instance.instantiateViewController(withIdentifier: "DebateView")
        
        splitViewController?.showDetailViewController(local, sender: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

class ModifyDebateViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(_ sender: Any) {
        
        let local = AppStoryboard.MainMenu.instance.instantiateViewController(withIdentifier: "DebateView")
        
        splitViewController?.showDetailViewController(local, sender: nil)
        
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

