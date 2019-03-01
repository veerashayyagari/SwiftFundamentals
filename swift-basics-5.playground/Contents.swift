/*
    Protocols are similar to interfaces, when you conform to a protocol
    You actually implement what the protocol expects to be implemented
 */

// Let's use a built in protocol, which expects a description property to be present for it to be conformed

struct Player {
    
    var name:String
    var age:Int
    var gamesPlayed:Int
    var lifeRemaining:Int
}

extension Player : CustomStringConvertible {
    var description: String {
        return "\(name) has played \(gamesPlayed) games and has \(lifeRemaining) lives"
    }
}

// Since player implements this builtin protocol, printing will actually present a nice description
var player1 = Player(name: "abc", age: 20, gamesPlayed: 3, lifeRemaining: 30)
print(player1)

// Defining your own custom protocol
protocol MyProtocol {
    func ShowMessage()
    
    var playerCountry:String { get }
}


/* Error handling , do try catch throw */

// Any custom error will adopt Error protocol. Error protocol doesn't enforce you to implement any property or func
enum ServerError : Error {
    case networkError
    case unauthenticatedError
    case badRequestError
}

// Now in some method that makes the call to network and receives some status code
func parse(statusCode: Int) throws -> Int {
    switch statusCode {
    case 1:
        print("Received a bad network error")
        throw ServerError.networkError
    case 2:
        print("Received Unauthenticated error")
        throw ServerError.unauthenticatedError
    case 3:
        print("Bad Request Error")
        throw ServerError.badRequestError
    default:
        print("Success!!")
    }
    
    return 0
}

do {
    let result = try parse(statusCode: 3)
    print(result)
}
catch ServerError.networkError {
    print("Network Error")
}
catch {
    print("Catch All")
}

// if you don't care about catching the error and are interested in successful result then
let newResult = try? parse(statusCode: 1)

/*
 Guard -> use when you want some condition to be true to continue further if not throw or return
 A Guard is similar to an IF condition but with a mandatory else which will either return or throw
 */

func printPlayerDetails(name:String?, age:Int?, gamesPlayed:Int?) -> String {
    guard let unwrappedName = name else { return "Can't print player details" }
    guard let unwrappedAge = age else { return "Can't print player details" }
    guard let unwrappedGamesPlayed = gamesPlayed else { return "Can't print player details" }
    return "\(unwrappedName) played \(unwrappedGamesPlayed) at the age of \(unwrappedAge)"
}

// As it's the same error message we can further simplify this as
func printPlayerDetails2(name:String?, age:Int?, gamesPlayed:Int?) -> String {
    guard let unwrappedName = name,
        let unwrappedAge = age,
        let unwrappedGamesPlayed = gamesPlayed else { return "Can't print player details" }
    return "\(unwrappedName) played \(unwrappedGamesPlayed) at \(unwrappedAge)"
}

printPlayerDetails(name: nil, age: 10, gamesPlayed: 2)
printPlayerDetails2(name: "abc", age: nil, gamesPlayed: nil)


/*
 Defer -> is a group of statements that can be executed at a later point of time
 when the scope of the current block is ending
 
 For example : In a function i want to close a connection before returning
 
 func readFile() {
    let fileReader = file.open()
    // Define the defered block that will execute whenever the current block scope is ending
    {
        file.close()
    }
 }
 */
