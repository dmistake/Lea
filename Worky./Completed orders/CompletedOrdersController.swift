//
//  CompletedOrdersController.swift
//  Worky.
//
//  Created by Александр Головин on 13.04.2021.
//

import UIKit

class CompletedOrdersController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.delegate = self
        self.table.dataSource = self
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OrdersData.shared.ArrayCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "CCell") as! CompletedTableViewCell
        
        cell.ClientLabel.text = OrdersData.shared.RenderClient()[indexPath.row]
        cell.DateLabel.text = OrdersData.shared.RenderDate()[indexPath.row]
        cell.OrderLabel.text = OrdersData.shared.RenderOrder()[indexPath.row]
        cell.PriceLabel.text = OrdersData.shared.RenderPrice()[indexPath.row]
        cell.DocLabel.text = OrdersData.shared.RenderDoc()[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            table.beginUpdates()
            OrdersData().DeleteClient(client: indexPath.row)
            table.deleteRows(at: [indexPath], with: .fade)
            table.deleteRows(at: [indexPath], with: .fade)
            table.endUpdates()
        } else { return }
        table.reloadData()
    }
    
}
