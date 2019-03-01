// Variables, implicit typing
var age = 23 // age is an Int
var test:Int? // declare them as optional variables, if not assigning during declaration
test = 20
let PI = 3.14 // let is used for declaring constants that never change

// test before using an optional variable
// Option 1
if test != nil {
    print(test!) // force unwrap an option variable
}
// Option 2
if let unwrappedTest = test {
    print(unwrappedTest)
}


// no implicit type casting
let a = 10
let b = 2.0
let c = a/Int(b)

// arrays
let primes = [2,3,5,7,11] // constant array, can't be modified
var evens:[Int] = [] // when initializing with empty array type is needed
evens.append(2) // adding a single element
evens.append(contentsOf: [4,6,8]) // joining an entire array
let firstEven = evens.removeFirst()

// if statement and string interpolation
if age < 20 {
    print("You are still younger at \(age)")
}
else {
    print("You are older at \(age)")
}

// switch statements (no break for every case)
let singleDigitPrime = 7
switch singleDigitPrime {
case 2:
    print("First even prime")
case 3:
    print("First Odd prime")
case 5,7:
    print("Just any other singledigit prime")
default:
    print("Some number")
}

// foreach statement
for even in evens {
    print(even)
}

// for with index
for idx in 0...evens.count-1 {
    print(evens[idx])
}
// can be simplified with outer bound excluded
for idx in 0..<evens.count {
    print(evens[idx])
}
// use stride to/through for increments > 1 or for increments < 0
// stride to excludes the higher bound
for number in stride(from: 0, to: evens.count, by: 2){
    print(evens[number])
}
// stride through includes the higher bound
for number in stride(from: 0, through: 256, by: 16){
    print(number)
}

