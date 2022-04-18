import Foundation

struct Restaurant: Identifiable {
    let id: UUID
    var name: String
    var phoneNumber: String
    var products: [Product]

    
    init(id: UUID = UUID(), name: String, phoneNumber: String, products: [String]) {
        self.id = id
        self.name = name
        self.phoneNumber = phoneNumber
        self.products = products.map { Product(name: $0) }
    }
    
}

extension Restaurant {
    struct Product: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    struct Data {
        var name: String = ""
        var phoneNumber = ""
        var products: [Product] = []
    }
    var data: Data {
        Data(name: name, phoneNumber: phoneNumber, products: products)
    }
    
    mutating func update(from data: Data) {
        name = data.name
        phoneNumber = data.phoneNumber
        products = data.products
    }
    init(data: Data) {
        id = UUID()
        name = data.name
        phoneNumber = data.phoneNumber
        products = data.products
    }
}

extension Restaurant{
    static let sampleData: [Restaurant] =
    [
        Restaurant(name: "Restaurant1", phoneNumber: "123456789", products: ["Pizza New York", "New Burger", "Domino's Classic"]),
        Restaurant(name: "Restaurant2", phoneNumber: "123415789", products: ["Ciorba de vacuta", "Paste carbonara"]),
        Restaurant(name: "Restaurant3", phoneNumber: "092194566", products: ["Snitel vienez cu cartofi nature"])
    ]
}
