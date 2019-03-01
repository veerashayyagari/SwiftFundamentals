// Structs

/*
    Structs are value types with support for properties and methods
    In Swift, all the basic value types like Int, Double, Bool and String are structs
    Structs unlike classes CANNOT be inherited
 */
struct Movie {
    var title:String
    /* note TypeInference */
    var releaseYear = 1995
    /* Can also use constants, language cannot be changed by instances of this struct */
    let language = "English"
    var genre:String
    
    /* Funcs defined in a struct / class are referred to as methods */
    func readMovie() -> String {
        return "\(title) in \(language) released \(releaseYear) of genre \(genre)"
    }
}

var firstMovie = Movie(title: "Shawshank Redemption", releaseYear: 1989, genre: "Drama")
var secondMovie = Movie(title: "Lord Of the Rings", releaseYear: 2001, genre: "Mythology")
print(firstMovie.readMovie())
print(secondMovie.readMovie())


// Tuples

/* Basic tuple */
var title = "Dark Knight"
var genre = "Thriller"
let movie = (title, genre)

/* Accessing elements in Tuple */
/* Option 1*/
print(movie.0)
print(movie.1)

/* Option 2, use decomposition */
let (movieTitle, movieGenre) = movie
print("Watching \(movieGenre) movie \(movieTitle)")

/* Option 3, provides an optional declaration */
let anotherMovie = (Title: "Inception", Genre: "Sci-Fi")
print("Watching \(anotherMovie.Genre) movie \(anotherMovie.Title)")

/* Obviously you can return a tuple from a func */
func getNextMovie() -> (String,String) {
    return ("Avatar", "Sci-Fi")
}

let (newMovieTitle, newMovieGenre) = getNextMovie()
print("Watching \(newMovieGenre) movie \(newMovieTitle)")


// Dictionaries

/* Literal Definition, just like an array */
var airlines = ["BA": "British Airlines", "EMI": "Emirates", "CP": "Cathay Pacific", "SWA": "Southwest Airlines"]

/* Get an element, always an Optional Value element which will be null if the key doesn't exist */
if let unwrappedValue = airlines["BA"] {
    print(unwrappedValue)
}
else{
    print("Key not found")
}

/* Add an element, just assign a value */
airlines["UA"] = "United Airlines"

/* Remove an element, just assign nil to the key */
airlines["UA"] = nil

/* Iterate over the dictionary, Key value pair can be decomposed as a tuple */
for (key,value) in airlines {
    print("\(key) : \(value)")
}
