//
//  MainClientViewController.swift
//  Worky.
//
//  Created by Александр Головин on 09.03.2021.
//

import UIKit
import MessageUI // Now we can email

class MainClientViewController: UIViewController, UISearchBarDelegate,  UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    //@IBOutlet weak var searchBar: UISearchBar!
    
    let data: [String] = ClientData().Render() // Goto database
   // var filteredData = [String]() // Search bar
   // var filtered = false // its search bar too
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // searchBar.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        tableView.reloadData() // Just for table update every view appear
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        guard let number = URL(string: "tel://" + ClientData().RenderPhone()[indexPath.row]) else { return } // Calling
        UIApplication.shared.open(number)
        view.endEditing(true)
    }
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if let text = searchBar.text {
//            filteredText(text) // Seach bar here
//        }
//    }
   
//    func filteredText(_ query: String) {
//        filteredData.removeAll()
//        for string in data {
//            if string.lowercased().starts(with: query.lowercased()) {
//                filteredData.append(string)
//            }
//        }
//        tableView.reloadData()
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if !filteredData.isEmpty {
//            return filteredData.count
//        }
        return ClientData().ArrayCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = ClientData()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ManagmentCell") as! ClientTableViewCell
        
//        if !filteredData.isEmpty {
//            cell.nameLabel.text = filteredData[indexPath.row]
//                    cell.thirdNameLabel.text = data.RenderthirdName()[indexPath.row]
//                    cell.organizationLabel.text = data.RenderOrganization()[indexPath.row]
//                    cell.nickLabel.text = data.RenderNick()[indexPath.row]
//                    cell.phoneLabel.text = data.RenderPhone()[indexPath.row]
//                    cell.addressLabel.text = data.RenderAddress()[indexPath.row]
//                    cell.emailLabel.text = data.RenderMail()[indexPath.row]
//                    cell.siteLabel.text = data.RenderSite()[indexPath.row]
//        } else {
            cell.nameLabel.text = data.Render()[indexPath.row]
            cell.thirdNameLabel.text = data.RenderthirdName()[indexPath.row]
            cell.organizationLabel.text = data.RenderOrganization()[indexPath.row]
            cell.nickLabel.text = data.RenderNick()[indexPath.row]
            cell.phoneLabel.text = data.RenderPhone()[indexPath.row]
            cell.addressLabel.text = data.RenderAddress()[indexPath.row]
            cell.emailLabel.text = data.RenderMail()[indexPath.row]
            cell.siteLabel.text = data.RenderSite()[indexPath.row]
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .normal, title: "Delete") { action, view, completionHandler in
                        tableView.beginUpdates()
                        ClientData().DeleteClient(client: indexPath.row)
                        tableView.deleteRows(at: [indexPath], with: .fade)
                        tableView.deleteRows(at: [indexPath], with: .fade) // I dont know why its double but it works, so it is
                        tableView.endUpdates()
            completionHandler(true)
        }
        delete.image = UIImage(systemName: "trash")
        delete.backgroundColor = .red
        
        let sendMail = UIContextualAction(style: .normal, title: "Mail") { action, view, completionHandler in
            let mailComposeViewController = configureMailComposer()
                if MFMailComposeViewController.canSendMail(){
                    self.present(mailComposeViewController, animated: true, completion: nil)
                } else {
                    print("Can't send email")
                }
            }
            func configureMailComposer() -> MFMailComposeViewController{
                let mailComposeVC = MFMailComposeViewController()
                mailComposeVC.mailComposeDelegate = self
                mailComposeVC.setToRecipients([ClientData().RenderMail()[indexPath.row]])
                mailComposeVC.setSubject("Покупка измельчителя древесины")
                mailComposeVC.setMessageBody("Уважемый/ая \(ClientData().Render()[indexPath.row]), уведомляем, что работы по вашему заказу начались.", isHTML: false)
                return mailComposeVC
        }
        sendMail.image = UIImage(systemName: "mail")
        sendMail.backgroundColor = .blue
        
        let swipe = UISwipeActionsConfiguration(actions: [delete, sendMail]) // U got, its left swipe, isnt u?
        return swipe
    }
    
    //MARK: - MFMail compose method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
  
    
    // same shit without mail sending
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .delete
//    }
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//        if editingStyle == .delete {
//            tableView.beginUpdates()
//            ClientData().DeleteClient(client: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            tableView.endUpdates()
//        } else { return }
//        tableView.reloadData()
//    }
    
    // Animation 
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.transform = CGAffineTransform(scaleX: 0, y : 0)
//                UIView.animate(withDuration: 0.5, animations: {
//                    cell.transform = CGAffineTransform(scaleX: 1, y : 1)
//                })
//    }
}



