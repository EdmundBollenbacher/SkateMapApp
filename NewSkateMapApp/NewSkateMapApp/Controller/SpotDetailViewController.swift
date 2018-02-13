//
//  SpotDetailViewController.swift
//  NewSkateMapApp
//
//  Created by Edmund Bollenbacher on 2/12/18.
//  Copyright © 2018 Edmund Bollenbacher. All rights reserved.
//

import UIKit

class SpotDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: SpotDetailHeaderView!
    
    
    @IBOutlet weak var spotLocationLabel: UILabel!
    @IBOutlet weak var spotDescriptionLabel: UILabel!
    
    @IBOutlet weak var spotImageView: UIImageView!
    
    var spot: Spot = Spot()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
        
        tableView.contentInsetAdjustmentBehavior = .never
        
        // configure header view
        headerView.nameLabel.text = spot.name
        headerView.typeLabel.text = spot.type
        headerView.headerImageView.image = UIImage(named: spot.image)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SpotDetailIconTextCell", for: indexPath) as! SpotDetailIconTextCell
            cell.iconImageView.image = UIImage(named: "bust")
            cell.shortTextLabel.text = spot.bust
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SpotDetailIconTextCell", for: indexPath) as! SpotDetailIconTextCell
            cell.iconImageView.image = UIImage(named: "map")
            cell.shortTextLabel.text = spot.location
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SpotDetailTextCell", for: indexPath) as! SpotDetailTextCell
            cell.descriptionLabel.text = spot.description
            
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SpotDetailSeperatorCell", for: indexPath) as! SpotDetailSeperatorCell
            cell.titleLabel.text = "HOW TO GET TO THE SPOT"
            
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SpotDetailMapCell", for: indexPath) as! SpotDetailMapCell
            cell.configure(location: spot.location)
            
            return cell
            
        default:
            fatalError("Fail")
        
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            let destinationVC = segue.destination as! MapViewController
            destinationVC.spot = spot
        }
        
    }
    

}
