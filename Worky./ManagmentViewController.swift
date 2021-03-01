//
//  ManagmentViewController.swift
//  Worky.
//
//  Created by Александр Головин on 02.02.2021.
//

import UIKit

struct Manager {
    var sectionName = ""
    var imagesArray: [String] = []
    var imageBackgroundArray: [UIColor] = []
    var array: [String] = []
    var footerName = ""
}

class ManagerFabric {
    static func sections() -> [Manager] {
        return [
            Manager(sectionName: "Клиенты & Работники", imagesArray: ["person.3.fill", "person.crop.square.fill.and.at.rectangle"], imageBackgroundArray: [UIColor.orange, UIColor.orange], array: ["Клиенты", "Работники"], footerName: "Добавляйте новых клиентов и работников."),
            Manager(sectionName: "Основное", imagesArray: ["figure.stand.line.dotted.figure.stand", "figure.stand"], imageBackgroundArray: [UIColor.link, UIColor.link], array: ["Проекты", "Задания"], footerName: ""),
            Manager(sectionName: "Учет времени", imagesArray: ["clock.arrow.circlepath", "clock.arrow.2.circlepath", "exclamationmark.arrow.circlepath"], imageBackgroundArray: [UIColor.red, UIColor.red, UIColor.red], array: ["Регулярное рабочее время", "Сумма сверхурочных", "Паузы"], footerName: "Укажите рабочее время для отображения сверхурочный часов и редактируйте сумму сверхурочных, сокращая или добавляю часы. Стандартная пауза будет добавлена по истечению рабочего времени."),
            Manager(sectionName: "Нерабочее время", imagesArray: ["photo", "asterisk.circle", "number.circle"], imageBackgroundArray: [UIColor.lightGray, UIColor.lightGray, UIColor.lightGray], array: ["Отпускные", "Больничные", "Праздники"], footerName: "Заполните, что бы отобразить нерабочие дни в разделе <<обзор>>."),
            Manager(sectionName: "Карты", imagesArray: ["list.number"], imageBackgroundArray: [UIColor.link], array: ["Рабочие места"], footerName: "Учет времени на основе местоположения.")
        ]
    }
}

class ManagmentViewController: UIViewController {
    
    var SectionsManager = ManagerFabric.sections()
    
    let imagesArray = ["person.3.fill", "person.crop.square.fill.and.at.rectangle", "figure.stand.line.dotted.figure.stand", "figure.stand", "clock.arrow.circlepath", "clock.arrow.2.circlepath", "exclamationmark.arrow.circlepath", "photo", "asterisk.circle", "number.circle", "list.number"]
    let imageBackgroundArray: [UIColor] = [UIColor.orange, UIColor.orange, UIColor.link, UIColor.link, UIColor.red, UIColor.red, UIColor.red, UIColor.lightGray, UIColor.lightGray, UIColor.lightGray, UIColor.link]
    //let names: [String] = ["Клиенты", "Работники", "Проекты", "Задания", "Регулярное рабочее время", "Сумма сверхурочных", "Паузы", "Отпускные", "Больничные", "Праздники", "Рабочие места"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}


extension ManagmentViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SectionsManager[section].sectionName
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return SectionsManager[section].footerName
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SectionsManager.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SectionsManager[section].array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ManagmentTableViewCell
        let arrays = SectionsManager[indexPath.section].array[indexPath.row]
        cell.mainImage.image = UIImage(systemName: SectionsManager[indexPath.section].imagesArray[indexPath.row])
        cell.mainImage.layer.cornerRadius = 4
        cell.mainImage.backgroundColor = SectionsManager[indexPath.section].imageBackgroundArray[indexPath.row]
        cell.nameLabel.text = arrays
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if SectionsManager[indexPath.section].array[indexPath.row] == "Клиенты" {
            performSegue(withIdentifier: "showVC1", sender: nil)
        }
        if SectionsManager[indexPath.section].array[indexPath.row] == "Работники" {
            performSegue(withIdentifier: "showVC2", sender: nil)
        }
        if SectionsManager[indexPath.section].array[indexPath.row] == "Проекты" {
            performSegue(withIdentifier: "showVC3", sender: nil)
        }
        if SectionsManager[indexPath.section].array[indexPath.row] == "Задания" {
            performSegue(withIdentifier: "showVC4", sender: nil)
        }
        if SectionsManager[indexPath.section].array[indexPath.row] == "Регулярное рабочее время" {
            performSegue(withIdentifier: "showVC51", sender: nil)
        }
        if SectionsManager[indexPath.section].array[indexPath.row] == "Сумма сверхурочных" {
            performSegue(withIdentifier: "showVC5", sender: nil)
        }
        if SectionsManager[indexPath.section].array[indexPath.row] == "Паузы" {
            performSegue(withIdentifier: "showVC6", sender: nil)
        }
        if SectionsManager[indexPath.section].array[indexPath.row] == "Отпускные" {
            performSegue(withIdentifier: "showVC7", sender: nil)
        }
        if SectionsManager[indexPath.section].array[indexPath.row] == "Больничные" {
            performSegue(withIdentifier: "showVC8", sender: nil)
        }
        if SectionsManager[indexPath.section].array[indexPath.row] == "Праздники" {
            performSegue(withIdentifier: "showVC9", sender: nil)
        }
        if SectionsManager[indexPath.section].array[indexPath.row] == "Рабочие места" {
            performSegue(withIdentifier: "showVC10", sender: nil)
        }
    }
}
