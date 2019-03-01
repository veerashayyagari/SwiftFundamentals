// Closures

/* Anonymous functions and the variety of syntax */

struct Book {
    var title:String
    var author:String
    var yearReleased:Int
}

let book1 = Book(title: "Where the wild things are", author: "Sendak", yearReleased: 1994)
let book2 = Book(title: "The Hobbit", author: "Tolkien", yearReleased: 2012)
let book3 = Book(title: "Oh, the places you'll go", author: "Seuss", yearReleased: 2010)

let allBooks = [book1, book2, book3]

/* let's try to sort the books by yearReleased */
func sortByYearReleased(book1:Book, book2:Book) -> Bool {
    return book1.yearReleased <= book2.yearReleased
}

let sortedBooks = allBooks.sorted(by: sortByYearReleased)
sortedBooks

/* Now let's try to do the samething inline */
let sortedBooks1 = allBooks.sorted(by: {
    (book1:Book, book2:Book) -> Bool
    in
    return book1.yearReleased <= book2.yearReleased
})
sortedBooks1

/* Further simplifying, as we know that the input parameters are of type Book and return type is Bool */
let sortedBooks2 = allBooks.sorted(by: {
    return $0.yearReleased <= $1.yearReleased
})

sortedBooks2

/* If the parameter that takes in a closure is the last parameter or the only parameter it can be brought out -
 trailing closure */
let sortedBooks3 = allBooks.sorted(by:){
    return $0.yearReleased <= $1.yearReleased
}

/* Obviously in this example as we have only one parameter having that in paranthesis is redundant, let's get rid of it */
let sortedBooks4 = allBooks.sorted { return $0.yearReleased <= $1.yearReleased }

/* Now since it's a single line in the closure, obviously return statement is redundant */
let sortedBooks5 = allBooks.sorted { $0.yearReleased <= $1.yearReleased }
sortedBooks5
