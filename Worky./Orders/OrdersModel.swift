//
//  OrdersModel.swift
//  Worky.
//
//  Created by Александр Головин on 12.04.2021.
//

import Foundation
import RealmSwift

class OrdersModel: Object {
    
//    private let kDateKey = "OrdersModel.kDateKey"
//    private let kClientKey = "OrdersModel.kClientKey"
//    private let kOrderKey = "OrdersModel.kOrderKey"
//    private let kPriceKey = "OrdersModel.kPriceKey"
//    private let kDocKey = "OrdersModel.kDocKey"
//
//    var Date: [String]? {
//        set { UserDefaults.standard.setValue(newValue, forKey: kDateKey) }
//        get { UserDefaults.standard.stringArray(forKey: kDateKey) }
//    }
//
//    var ClientName: [String]? {
//        set { UserDefaults.standard.setValue(newValue, forKey: kClientKey) }
//        get { UserDefaults.standard.stringArray(forKey: kClientKey) }
//    }
//
//    var Order: [String]? {
//        set { UserDefaults.standard.setValue(newValue, forKey: kOrderKey) }
//        get { UserDefaults.standard.stringArray(forKey: kOrderKey) }
//    }
//
//    var Price: [String]? {
//        set { UserDefaults.standard.setValue(newValue, forKey: kPriceKey) }
//        get { UserDefaults.standard.stringArray(forKey: kPriceKey) }
//    }
//
//    var Doc: [String]? {
//        set { UserDefaults.standard.setValue(newValue, forKey: kDocKey) }
//        get { UserDefaults.standard.stringArray(forKey: kDocKey) }
//    }
    
    @objc dynamic var Date = ""
    @objc dynamic var ClientName = ""
    @objc dynamic var Order = ""
    @objc dynamic var Price = ""
    @objc dynamic var Doc = ""
    
}

class ModelData {
    static let shared = ModelData()
    private let realm = try! Realm()
    
    func Add(date: String, clientName: String, Order: String, price: String, doc: String) {
        
        let order = OrdersModel()
        order.self.Date = date
        order.self.ClientName = clientName
        order.self.Order = Order
        order.self.Price = price
        order.self.Doc = doc
        
        try! realm.write {
            realm.add(order)
        }
    }
    
    func DeleteClient(client: Int) {
        let people = realm.objects(OrdersModel.self)
        var count = 0
        while count < ArrayCount() {
            for _ in people {
                if count != client {
                    count = count + 1
                }
                if count == client {
                    let item = people[client]
                    try! realm.write() {
                        realm.delete(item)
                        count = count + 1
                    }
                }
            }
        }
    }
    
    func ArrayCount() -> Int {
        var allClients = 0
        let people = realm.objects(OrdersModel.self)
        for _ in people {
            allClients = allClients + 1
        }
        return allClients
    }
    
    func RenderDate() -> [String] {
        var array: [String] = []
        var lastname = ""
        let people = realm.objects(OrdersModel.self)
        for person in people {
            lastname = person.Date
            let names = lastname
            array.append(names)
        }
        return array
    }
    func RenderClient() -> [String] {
        var array: [String] = []
        var lastname = ""
        let people = realm.objects(OrdersModel.self)
        for person in people {
            lastname = person.ClientName
            let names = lastname
            array.append(names)
        }
        return array
    }
    func RenderOrder() -> [String] {
        var array: [String] = []
        var lastname = ""
        let people = realm.objects(OrdersModel.self)
        for person in people {
            lastname = person.Order
            let names = lastname
            array.append(names)
        }
        return array
    }
    func RenderPrice() -> [String] {
        var array: [String] = []
        var lastname = ""
        let people = realm.objects(OrdersModel.self)
        for person in people {
            lastname = person.Price
            let names = lastname
            array.append(names)
        }
        return array
    }
    func RenderDoc() -> [String] {
        var array: [String] = []
        var lastname = ""
        let people = realm.objects(OrdersModel.self)
        for person in people {
            lastname = person.Doc
            let names = lastname
            array.append(names)
        }
        return array
    }
    
}
