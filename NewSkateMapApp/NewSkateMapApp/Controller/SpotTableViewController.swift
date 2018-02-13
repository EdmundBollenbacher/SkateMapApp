//
//  SpotTableViewController.swift
//  NewSkateMapApp
//
//  Created by Edmund Bollenbacher on 2/11/18.
//  Copyright © 2018 Edmund Bollenbacher. All rights reserved.
//

import UIKit

class SpotTableViewController: UITableViewController {
    
    var spots:[Spot] = [
        Spot(name: "El Toro", type: "Stairs/Rail", location: "25255 Toledo Way, Lake Forest, California 92630, United States", description: "One of the most iconic skate spots to this day", image: "elToro", bust: "Low"),
        Spot(name: "Lyons 25", type: "Stairs", location: "France", description: "", image: "lyons25", bust: ""),
        Spot(name: "Hubba Hideout", type: "Hubba", location: "SF", description: "", image: "hubbaHideout", bust: "")
    ]
    
    // MARK: - view controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.cellLayoutMarginsFollowReadableWidth = true
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        if let customFont = UIFont(name: "BarlowCondensed-Medium", size: 40.0) {
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor(red: 101, green: 236, blue: 161), NSAttributedStringKey.font: customFont]
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }
    
    // MARK: - IBActions

    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source protocol

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return spots.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSpotDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationVC = segue.destination as! SpotDetailViewController
                destinationVC.spot = spots[indexPath.row]
            }
        }
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        // create and option menu as an action sheet
//        let optionsMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
//        
//        // add actions to the menu
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        
//        optionsMenu.addAction(cancelAction)
//        
//        
//        // add call action
//        let callActionHandler = { (action: UIAlertAction!) -> Void in
//            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, no call. Try again later", preferredStyle: .alert)
//            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(alertMessage, animated: true, completion: nil)
//        }
//        
//        let callAction = UIAlertAction(title: "Call" + "123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
//        optionsMenu.addAction(callAction)
//        
//        if let popoverController = optionsMenu.popoverPresentationController {
//            if let cell = tableView.cellForRow(at: indexPath) {
//                popoverController.sourceView = cell
//                popoverController.sourceRect = cell.bounds
//            }
//        }
//        
//        // display the menu
//        present(optionsMenu, animated: true, completion: nil)
//        
//        // deselect row
//        tableView.deselectRow(at: indexPath, animated: false)
//        
//    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SpotTableViewCell

        // Configure the cell...
        cell.nameLabel.text = spots[indexPath.row].name
        cell.spotImageView.image = UIImage(named: spots[indexPath.row].image)
        cell.locationLabel.text = spots[indexPath.row].location
        cell.typeLabel.text = spots[indexPath.row].type

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
