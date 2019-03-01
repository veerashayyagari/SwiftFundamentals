// Functions

/* Basic */
func show(message:String) {
    print("Message to Display: \(message)")
}

func difference(totalAmount:Int, discount:Int) -> Int {
    return totalAmount - discount
}

show(message: "Hello world")
difference(totalAmount: 250, discount: 50)

/* Avoid argument names in method calls by prepending with _ */
func show1(_ message:String){
    print("Message to Display : \(message)")
}

show1("Welcome to functions in swift")

/* Having different argument names when calling the function */
func difference1(between totalAmount:Int, and discount:Int) -> Int {
    return totalAmount - discount
}

difference1(between: 49, and: 9)

/* Correctly ignoring return types */
func printAndReturn(_ message:String) -> Int {
    print(message)
    return 0
}

_ = printAndReturn("Abc")



// Enumerations

/* Defining a basic enum */
enum MediaType {
    case book
    case video
    case audio
    case documentary
}

enum MediaType1 { case book, video, audio, documenatary }

/* Assigning and using them */
var actionType: MediaType = .book

switch actionType {
case .book:
    print("Reading \(actionType)")
case .video:
    print("Watching \(actionType)")
case .audio:
    print("Listening \(actionType)")
case .documentary:
    print("Educating with \(actionType)")
}

/* Assign raw values to enum */
enum Genre:String {
    case horror = "Paranormal Activity"
    case comedy = "Dumb and Dumber"
    case action = "Die Hard"
}

var genreType: Genre = .action
switch genreType {
case .horror:
    print("\(genreType) Movie \(genreType.rawValue)")
case .comedy:
    print("\(genreType) Movie \(genreType.rawValue)")
case .action:
    print("\(genreType) Movie \(genreType.rawValue)")
}

/* Assigning associated values */
enum MediaType2 {
    case movie(String)
    case music(Int)
    case book(String)
}

var firstItem: MediaType2 = .movie("Comedy")
var secondItem: MediaType2 = .music(120)

switch firstItem {
case .book(let genre):
    print("Reading \(firstItem), Genre: \(genre)")
case .movie(let genre):
    print("Watching \(firstItem), Genre : \(genre)")
case .music(let bpm):
    print("Listening \(firstItem) , BPM : \(bpm)")
}
