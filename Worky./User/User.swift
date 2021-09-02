import Foundation

class UserModel {
    static let shared = UserModel()
    
    private let fUserNameKey = "UserModel.kUserNameKey"
    private let sUserNameKey = "UserModel.sUserNameKey"
    private let tUserNameKey = "UserModel.tUserNameKey"
    private let teUserNameKey = "UserModel.teUserNameKey"
    private let maUserNameKey = "UserModel.maUserNameKey"
    private let adUserNameKey = "UserModel.adUserNameKey"
    
    private let wantToScan = "UserModel.wantToScan"
    
    var userFirstName: String? {
        set { UserDefaults.standard.set(newValue, forKey: fUserNameKey) }
        get { return UserDefaults.standard.string(forKey: fUserNameKey) }
    }
    var userSecondName: String? {
        set { UserDefaults.standard.set(newValue, forKey: sUserNameKey) }
        get { return UserDefaults.standard.string(forKey: sUserNameKey) }
    }
    var userThirdName: String? {
        set { UserDefaults.standard.set(newValue, forKey: tUserNameKey) }
        get { return UserDefaults.standard.string(forKey: tUserNameKey) }
    }
    var userTel: String? {
        set { UserDefaults.standard.set(newValue, forKey: teUserNameKey) }
        get { return UserDefaults.standard.string(forKey: teUserNameKey) }
    }
    var userMail: String? {
        set { UserDefaults.standard.set(newValue, forKey: maUserNameKey) }
        get { return UserDefaults.standard.string(forKey: maUserNameKey) }
    }
    var userAddress: String? {
        set { UserDefaults.standard.set(newValue, forKey: adUserNameKey) }
        get { return UserDefaults.standard.string(forKey: adUserNameKey) }
    }
    
    var userWantToScan: Bool? {
        set { UserDefaults.standard.set(newValue, forKey: wantToScan) }
        get { return UserDefaults.standard.bool(forKey: wantToScan) }
    }
}
