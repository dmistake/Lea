//
//  OrdersController.swift
//  Worky.
//
//  Created by Александр Головин on 12.04.2021.
//

import UIKit

class OrdersController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    var dateItems = [String]()
    var clientItems = [String]()
    var orderItems = [String]()
    var priceItems = [String]()
    var docItems = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.delegate = self
        self.table.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ModelData.shared.ArrayCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell") as! OrdersTableViewCell
        cell.ClientName.text = ModelData.shared.RenderClient()[indexPath.row]
        cell.DateLabel.text = ModelData.shared.RenderDate()[indexPath.row]
        cell.OrderLabel.text = ModelData.shared.RenderOrder()[indexPath.row]
        cell.PriceLabel.text = ModelData.shared.RenderPrice()[indexPath.row]
        cell.DocLabel.text = ModelData.shared.RenderDoc()[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
        let alert = UIAlertController(title: "Вы действительно хотите переместить заказ в архив?", message: "Данное действие перенесет текущий заказ в архив. Его можно будет посмотреть в соответствующем меню.", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { action in
                                        if let date = ModelData.shared.RenderDate()[indexPath.row] as? String {
                                            if let client = ModelData.shared.RenderClient()[indexPath.row] as? String {
                                                if let order = ModelData.shared.RenderOrder()[indexPath.row] as? String {
                                                    if let price = ModelData.shared.RenderPrice()[indexPath.row] as? String {
                                                        if let doc = ModelData.shared.RenderDoc()[indexPath.row] as? String {
                                                            OrdersData.shared.Add(date: date, clientName: client, Order: order, price: price, doc: doc)
                                                            self.table.beginUpdates()
                                                            ModelData().DeleteClient(client: indexPath.row)
                                                            self.table.deleteRows(at: [indexPath], with: .fade)
                                                            self.table.deleteRows(at: [indexPath], with: .fade)
                                                            self.table.endUpdates()
                                                        }
                                                    }
                                                }
                                            }
            }
                                        self.reloadInputViews() }))
        alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            table.beginUpdates()
            ModelData().DeleteClient(client: indexPath.row)
            table.deleteRows(at: [indexPath], with: .fade)
            table.deleteRows(at: [indexPath], with: .fade)
            table.endUpdates()
        } else { return }
        table.reloadData()
    }

}
