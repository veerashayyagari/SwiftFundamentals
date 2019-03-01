// Classes

/*
    Similar to a struct but
    1) Enforces to have initial value for the properties or intialize through a constructor
    2) Is not a value type but a reference type
    3) Can participate in inheritance
 */

class Appliance {
    // Stored properties, which store the value
    var manufacturer:String
    var voltage:Int
    var isElectric:Bool
    var Cost:Double? // is optional, need not be initialized
    
    // Computed Property
    var ActualCost : Double? {
        get {
            if let unwrappedCost = self.Cost,
                isElectric == true {
                return unwrappedCost * 10
            }
            
            return self.Cost
        }
        set{
            // can have a set statement as well but doesn't make sense for a computed property
            print("\(newValue!) is being set for Actual Cost")
        }
    }
    
    init() {
        self.manufacturer = "Washer"
        self.voltage = 0
        self.isElectric = true
    }
    
    init(cost:Double) {
        self.Cost = cost
        self.manufacturer = "Washer"
        self.voltage = 0
        self.isElectric = true
    }
    
    /* deinit is like a destructor
        - called automatically during garbage collection
        - can be used only with in a class
     */
    deinit {
        // this is where we deallocate network , database connections
    }
    
    func PrintDetails() -> String {
        if self.Cost != nil {
            return "\(self.manufacturer) costed around \(self.Cost!) and runs at a voltage \(self.voltage)"
        }
        
        return "\(self.manufacturer) runs at a voltage \(self.voltage)"
    }
}

let appliance1 = Appliance()
appliance1.voltage = 10
appliance1.Cost = 23.45
appliance1.ActualCost
appliance1.isElectric = false
appliance1.ActualCost

appliance1.PrintDetails()

let appliance2 = Appliance(cost:23.5)
appliance2.voltage = 21
appliance2.PrintDetails()

/* Value vs Reference type */

struct Message {
    var internalMessage:String
}

var obj1 = Message(internalMessage: "Initial String")
var obj2 = obj1
obj2.internalMessage += "is modified"

print(obj1.internalMessage == obj2.internalMessage)

class AnotherMessage {
    var internalMessage:String = "Initial String"
}

var obj3 = AnotherMessage()
var obj4 = obj3
obj4.internalMessage += "is modified"
print(obj3.internalMessage == obj2.internalMessage)

/* Note : Cannot use == to compare two reference variables */
print(obj3 === obj4)

/*
    If we declare any value type as a constant use 'let' we will not be able to modify it and underlying properties
    This is not really the case with reference types like classes
 
 let msg1 = Message(internalMessage: "test")
 msg1.internalMessage += " one"
 
 will not compile, where as
 
 let msg2 = AnotherMessage()
 msg2.internalMessage += " two"
 
 is OK
 */


/* Adding additional functionality using extensions */

extension String {
    func removeSpaces() -> String {
        let filteredString = self.filter { $0 != " " }
        return String(filteredString)
    }
}

let test = " The Fox Jumped Over a Lazy Dog"
print(test.removeSpaces())


