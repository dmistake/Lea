import Foundation
import RealmSwift

class Client: Object {
    @objc dynamic var name = ""
    @objc dynamic var surname = ""
    @objc dynamic var thirdName = ""
    
    @objc dynamic var organizationName = ""
    @objc dynamic var nickName = ""
    @objc dynamic var phone = ""
    @objc dynamic var email = ""
    @objc dynamic var address = ""
    @objc dynamic var site = ""
}

//MAIN CLASS HERE
class ClientData {
    static let shared = ClientData()
    private let realm = try! Realm()
    
    func AddClient(name: String, surname: String, thirdName: String, organizationName: String, nickName: String, phone: String, email: String, address: String, site: String) {
        
        let user = Client()
        user.self.name = name
        user.self.surname = surname
        user.self.thirdName = thirdName
        user.self.organizationName = organizationName
        user.self.nickName = nickName
        user.self.phone = phone
        user.self.email = email
        user.self.address = address
        user.self.site = site
        
        try! realm.write {
            realm.add(user)
        }
    }

    // Delete function ist perfect visualy but works perfectly
    func DeleteClient(client: Int) {
        let people = realm.objects(Client.self)
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
    
    
    func Render() -> [String] {
        var array: [String] = []
        var firstname = ""
        var lastname = ""
        let people = realm.objects(Client.self)
        for person in people {
            firstname = person.name
            lastname = person.surname
            let names = lastname + " " + firstname
            array.append(names)
        }
        return array
    }
    func RenderthirdName() -> [String] {
        var array: [String] = []
        var lastname = ""
        let people = realm.objects(Client.self)
        for person in people {
            lastname = person.thirdName
            let names = lastname
            array.append(names)
        }
        return array
    }
    func RenderOrganization() -> [String] {
        var array: [String] = []
        var lastname = ""
        let people = realm.objects(Client.self)
        for person in people {
            lastname = person.organizationName
            let names = lastname
            array.append(names)
        }
        return array
    }
    func RenderNick() -> [String] {
        var array: [String] = []
        var lastname = ""
        let people = realm.objects(Client.self)
        for person in people {
            lastname = person.nickName
            let names = lastname
            array.append(names)
        }
        return array
    }
    func RenderPhone() -> [String] {
        var array: [String] = []
        var lastname = ""
        let people = realm.objects(Client.self)
        for person in people {
            lastname = person.phone
            let names = lastname
            array.append(names)
        }
        return array
    }
    func RenderAddress() -> [String] {
        var array: [String] = []
        var lastname = ""
        let people = realm.objects(Client.self)
        for person in people {
            lastname = person.address
            let names = lastname
            array.append(names)
        }
        return array
    }
    func RenderMail() -> [String] {
        var array: [String] = []
        var lastname = ""
        let people = realm.objects(Client.self)
        for person in people {
            lastname = person.email
            let names = lastname
            array.append(names)
        }
        return array
    }
    func RenderSite() -> [String] {
        var array: [String] = []
        var lastname = ""
        let people = realm.objects(Client.self)
        for person in people {
            lastname = person.site
            let names = lastname
            array.append(names)
        }
        return array
    }
    
    func ArrayCount() -> Int {
        var allClients = 0
        let people = realm.objects(Client.self)
        for _ in people {
            allClients = allClients + 1
        }
        return allClients
    }
    
}
