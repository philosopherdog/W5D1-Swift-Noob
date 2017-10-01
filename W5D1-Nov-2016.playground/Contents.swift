import UIKit
/*:
 ## Swift 3/4
 
 - In 2014 Apple blew away developers with a surprise announcement that a new programming language called Swift had been secretly under development for 4 years!
 
 - Since being announced Swift has been officially open sourced and has been ported to Linux. This is huge because it makes its use on servers possible.
 
 */
/*:
 
 #
 ## Playgrounds
 
 - Playgrounds is a simple 'Live Coding' environment. 👍🏻👍🏻👍🏻👍🏻
 
 - But Playgrounds are crash prone. 👎🏻👎🏻👎🏻 (💪🏻 set the run option to manual).
 */
//: 👷🏼 Create a sample playground:
/*:
 ### Markup in Playgrounds
 
 - You can view markdown (Apple calls it "markup") in Playgrounds using a special syntax. You can find the syntax [here](https://developer.apple.com/library/content/documentation/Xcode/Reference/xcode_markup_formatting_ref/).
 
 - Toggle between rendering and raw markup using the menu item: `editor > show raw markup` or `editor > show rendered markup`
 */
//: ![Imgur](render-markup.png)

/*:
 ## Variables & Constants
 - Declare variables with the  `var` keyword.
 - Constants are declared with `let`.
 */
let birthYear = 1988
let name = "George"
let 🐱 = "cat"
let cat:Character = "🐱"
var breakfast = "Eggs"
breakfast = "Toast"

/*:
 ## Types & Type Inference
 - Swift declares types *after* the name following a colon
 */

var address: String = "289 Anywhere St"

/*:
 - Swift supports "type inference" which allows us to omit the type when we have a value to assign and it is one the compiler recognizes as default.
 */

var address2 = "34 Jones Cr"

var address3: String // here we must give address3 a type because it has no value assigned

/*:
 #### Types
 - Types are always upper cased
 - Instances are always lower cased
 - There are Swift specific foundation types for Int, Double, String, Array, Dictionary, Set, etc.
 - Swift can also easily and seamlessly cast between Swift Foundation types and the older foundation classes we're used to in Objc.
 - Swift has a generic type like `id` called `Any`. (There is also `AnyObject` and the relationship between these has morphed in complex ways. Find info [here](https://medium.com/@mimicatcodes/any-vs-anyobject-in-swift-3-b1a8d3a02e00).
 - For types that are related either by subclassing or protocols you can cast using the **as** keyword. (I will not talk about failable casting here).
 */

var address4 = address2 as NSString
let address5 = address4 as Any
let address6 = address5 as! NSString // we'll discuss "!" below

/*:
 - If you mean to convert between types then you must pass one value to the constructor of another. Eg.:
 */

let numerOfCats = 10
let numerOfCatsString = String(numerOfCats)

//: **Tip:** prefer Swift types where possible

//: Integer literals default to Swift **Int** type, which is a struct (more on structs below).

var n1 = 1
let n2 = -2

//: Float literals default to **Double**, which is also a struct type!

var f1 = 1.0
let f2 = 2.0

//: **Tip:** prefer Int and Double to other numeric types

//: There are many other numeric types
let f4: Float = 4.0
var u1: UInt = 20
var n32: Int32 = 32 // You can specify Int sizes
let cgFloat: CGFloat = 2.0

/*:
 ### `print()` & String Interpolation
 - No more `NSLog` 👍🏻
 - Use `print()` instead
 */
let s2 = "Mud"
print(#line, f1)
print("\(#line) my name is \(s2)")
print("(#line) my favourite number is \(f4 + Float(f2))")
print(#line, "you can also use print like", "this", "because print is a variadic function!")

/*:
 ## Operators
 - "+ - * / = > >= < <= == ===" work similar to Objc
 - But you can use some of them on Strings as well
 */

var s5 = "new "
let r1 = s5 + "world order" // Objc string concat 👎🏻
var s3 = "His name is " + "Bobby"
s3 += " Fisher"
s3

/*:
 ## Bool
 - Unlike Objc we don't use `YES` and `NO` 👎🏻
 - use `true` and `false` instead
 */

let name2 = "Freddy Mercury"
let result1 = name2.hasPrefix("Freddy")

if result1 {
  print("he's the singer of Queen")
}
if name2.hasSuffix("Freddy") {
  print("this never executes")
}

/*:
 ## String
 - The String class in Swift makes string manipulation complex.
 */

let char:Character = "T"
let s6 = String(char)

let name3 = "donald drumpf"
let name3Cap = name3.capitalized(with: Locale.current)

// lower case are ordered before upper case
if name3 > name3Cap {
  print("You can compare strings")
}

var name4 = name3
name4.removeAll()
let result3 = name4.isEmpty == true ? "Empty" : "Not Empty"
name3

/*:
 ## Optionals
 - All variables/constants members in Swift must have a value at initialization unlike Objc
 */

/*
 Objc allows variables to be nil
 
 NSString *s7;
 if (s7) {
 NSLog(@"%@", s7)
 }
 */

/*:
 - **In Swift we must explicitly mark a variable/constant as an Optional type which allows it to be either nil or some value**
 */

var notAllowed: String

// error
//if notAllowed == nil {
//  print("not allowed")
//}

var opt1: String?
opt1

if opt1 == nil {
  print(#line, "we have marked opt1 as able to be \(opt1)")
}

opt1 = "my first optional string"

/*:
 ## Why Optionals Need to be Unwrapped
 - Think of Optionals as a box, just like NSNumber in Objc.
 - You can't do very much with an NSNumber in Objc unless you call `intValue`\`integerValue` on it to get the underlying value. Optionals are the same. They can only be used for nil checking without **unwrapping** them.
 */

//opt1 += " extra stuff"

/*:
 ### Forced Unwrap
 - The simplest and most dangerous way to unwrap (unbox) an optional is called `forced unwrap`
 - Generally avoid this unless you are sure of what you're doing
 - It simply uses the bang `!` operator
 */

var n3: Int?
n3 = 20

// n3 + 10 //error n3 is not an Int

let r4 = n3! + 20

/*:
 - Optionals allow you to set any value to nil, including (wrapped) C Struct types, and Int values. Can you set integers to nil in Objc?
 */

var n5:Int? = nil

var rect: CGRect? = nil

// CGRect rect = nil; //Objc error in Objc because CGRect is a primitive type

/*:
 - You can force unwrap after checking for nil first. You will almost never want to do this.
 */

if n3 != nil {
  // force unwrap after nil checking
  n3!
}

//: Notice `let` allows you to start as nil and then do an initial assignment
let n6:String?
n6 = "yippy"

// n6 = "NO" //error you can't reassign `let`

/*:
 ### Optional Binding
 - Swift provides convenience syntax for binding an optional to a variable
 */

if let n6 = n6 {
  print(#line, n6) // prints YES
}

//: **Tip:** The constant we bind it to can be named anything, but always prefer to re-use the initial name when possible (this is the preferred style)

if let someConstant = n6 {
  print(#line, someConstant + " more stuff") // prints YES, notice I don't have to unwrap it using (!) inside the block.
}

//: guard lets you bind and handle the unwrapped optional outside the block! This is insanely powerful. 👍🏻

guard let n6 = n6 else {
  fatalError()
}

n6 // is unwrapped now

//: But notice guard doesn't let you fall through. So, use it for conditions that are failing. You can use guard for ordinary if checking too.

guard 6 == 6 else {
  // the universe makes no sense!
  fatalError()
}

/*:
 ## Casting & Optionals
 */

let anyString = "some string" as AnyObject // upcasting never fails
let downCastString = anyString as? String // downcasting can fail so it returns an optional

/*:
 ## Arrays
 - Similar to `NSArray`, and you can still use `NSArray` (prefer `Array`)
 - `NSArray` is heterogeneous, but you can limit it using generics.
 - `Array` is homogeneous by design, but can be made heterogeneous (you almost always want arrays to be homogeneous)
 */


let a1 = [2, 4, 6, 8] // [Int] type inferred

let a22: [Any] = [2, 4, 6, 8, "John"] // You must explicitly cast this

//: Create Mutable Empty Array of String types in 3 Ways! (prefer the second way)

var a3: [String] = [] // this seems more intuitive to me
var a4 = [String]()
var a55: Array<String> = []

a3.append("One")
let a5 = ["Two", "Three"]
a3.append(contentsOf: a5)
a3

// accessing
a3[0]

let a222 = a3 + a5 // easy concat

/*:
 ## Range
 - Used to access a range of values, similar to NSRange
 */

//: Closed Range
let range1 = 1...3
a1[range1]

// check if a value is in a range!
if range1 ~= 1 {
  print("yes 1 is within range1")
}

a3[0...1] // slicing an array

// Swift 4 adds open ended range slicing!
a3[..<2]
a3[1...]


//: Half-Open Range
let range2 = 0..<2
a3[range2]

var n7 = [Int](1...10)
n7.removeSubrange(0...5)

n7
n7[0] = 100
n7

n7.remove(at: n7.count-1)
n7

//: looping through an array
for i in n7 {
  print(#line, i)
}

//: looping with an index

for i in 0..<n7.count {
  print(#line, "index: \(i), value: \(n7[i])")
}

//: loop with index and value

for (index, value) in n7.enumerated() {
  print(#line, "index: \(index), value: \(value)")
}



//: No C style loops as of Swift 3+!

/*
 for (i = 0; i < 10; ++i) {
 
 }
 */

// Use `_` if you don't need the index
for _ in 0...3 {
  print(#line, "again")
}

//: You can use stride for full control
for i in stride(from: 10, to: 0, by: -1) {
  print(#line, i)
}

/*:
 ## Dictionary
 - Similar to `NSDictionary`.
 - `NSDictionary` is heterogeneous by design.
 - `Dictionary` is homogeneous by design.
 */

//: Immutable

let finalGradeDict1:[String: Int]
finalGradeDict1 = ["John": 88, "Erik": 60, "Lori": 70]

let grade1 = finalGradeDict1["John"]

// Dictionary access always returns an optional!

//: Mutable

var answersDict: [Int: Int] = [2: 2*2, 3: 3*3, 4: 4*4]
let answer1 = answersDict[2]
let answer2 = answersDict[5]

if let answer2 = answer2 {
  print(#line, "\(answer2) is nil", "this will never execute!")
}

// mutating
answersDict[2] = 33

answersDict

// deleting a value

answersDict[2] = nil
answersDict

/*:
 ### Looping Over a Dictionary
 - Dictionaries can be looped over (DO NOT RELY ON THE ORDER)
 */

let interestingNumbers =
  ["Prime": [2, 3, 5, 7, 11, 13],
   "Fibonacci": [1, 1, 2, 3, 5, 8],
   "Square": [1, 4, 9, 16, 25]
]

for (kind, numbers) in interestingNumbers {
  print(#line, kind)
  for number in numbers {
    print(#line, number)
  }
}

/*:
 ## Switch
 `switch` much more powerful in Swift. Not just limited to integers
 
 1. switch on any type of data.
 2. can handle complex cases.
 3. switch must be **exhaustive**.
 4. `break` is implicit (use `fallthrough` if you don't want this behaviour)
 */

var comment:String?
let vegetable = "red pepper"

switch vegetable {
case "celery":
  comment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
  comment = "That would make a good tea sandwich."
case let pepper where vegetable.hasSuffix("pepper"):
  comment = "Is it a spicy \(pepper)?"
default:
  comment =  nil
}

guard let comment = comment else {
  fatalError() // usually return
}

comment // unwrapped here!

/*:
 ## While Loop
 */

var count = 0
while count < 5 {
  print(#line, count)
  count += 1
}

//: repeat-while is Swift's do-while

var count2 = 0
repeat {
  print(#line, count2)
  count2 += 1
} while count2 < 0

/*:
 ## Functions
 - Functions are named closures.
 - Functions are first class citizens (unlike Objc).
 - Functions can be nested inside other functions.
 - Functions can be passed as parameters, assigned to variables, added to collections, etc.
 */

func greeting() -> () {
  print(#line, "hello!")
}

greeting()

let funcToConstant = greeting
funcToConstant()
let funcArray = [greeting]
funcArray[0]()

//: Unlike Objc Swift includes an initial external parameter name (new in Swift 3)

func greetingWith(firstName: String, hours: Int) -> String {
  return "\(#line) \(firstName) you have \(hours) hours this week"
}

greetingWith(firstName: "John", hours: 10)

//: This is how you ommit the first param like Objc (Don't do it this way unless you're interoperating with Objc).

func greetingWithFirstName(_ firstName:String) -> String {
  return "\(#line) hello \(firstName)"
}

greetingWithFirstName("Mammy")

//: [More about functions](https:developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Functions.html#apple_ref/doc/uid/TP40014097-CH10-ID158)

/*:
 ## Closures
 - They function identically to Objc blocks (which we haven't explicitly talked about!).
 - Closures are simply unnamed functions.
 */

//: Function

func greeting3(name: String) -> String {
  return "\(#line) hello \(name)"
}

greeting3(name: "Jimmy")

//: Same function as a closure

let close1: (String) -> (String) = {(name:String) -> String in
  return "\(#line) hello \(name)"
}

close1("Nickolas")

//: Swift can infer the type of a closure

let close2 = {() -> () in
  print(#line, "inferred type")
}


//: Simple Map Example (map, reduce, filter)

let numbers = [10, 7, 28, 9, 83, 73, 65, 2, 39]

let numStrings = numbers.map( { (number: Int) -> String in
  return "\(number)"
})

numStrings

//: [More about closures](https:developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Closures.html#apple_ref/doc/uid/TP40014097-CH11-ID94)

/*:
 ## Tuples
 - Tuples are a heterogenous grouping of values
 - Function parameters are actually tuples, but you can pass tuples too (?)
 - Can be used to return more than 1 value from a function
 - Should be used judiciously for passing data to a function or returning data (prefer real objects)
 */

var person = (firstName: "Dolly", lastName: "Wheeler", age: 33)

person.0
person.firstName

person.1
person.lastName

person.2
person.age

func returnTuple() -> (firstName: String, lastName: String, age: Int) {
  return (firstName: "John", lastName: "Doe", age: 45)
}

let nameTuple = returnTuple()
nameTuple.firstName
nameTuple.1
nameTuple.age

if nameTuple == ("John", "Doe", 45) {
  print(#line, "you can use them in comparisons")
}

//: You can bind individual values to names
let (theFirstName, theLastName, _) = returnTuple()

theFirstName
theLastName

/*:
 ## Classes
 - Swift has 3 object types Classes, Structs, and Enums.
 - Classes are reference types.
 - Structs and Enums are value types.
 */

class LibraryCard {
  let number: String
  init(_ number: String) {
    self.number = number
  }
}

class Boss: CustomStringConvertible {
  var description: String {
    return "Big Boss"
  }
}

class Person {
  lazy var boss = Boss()
  let firstName: String
  let lastName: String
  var age: Int = 20 {
    // property observer
    didSet {
      print(#line, oldValue)
    }
  }
  
  let libraryCard: LibraryCard?
  init(firstName: String, lastName:String, libraryCard: LibraryCard? ) {
    self.firstName = firstName
    self.lastName = lastName
    self.libraryCard = libraryCard
  }
  // computed property
  func fullName() -> String {
    return firstName + " " + lastName
  }
}

let fred = Person(firstName: "Fred", lastName: "Wallace", libraryCard: LibraryCard("2222"))

fred.firstName
fred.lastName
fred.age = 44 // setting age
fred.libraryCard
fred.boss

fred.fullName()

//: **Notice:** classes have a default init which is no longer used once you create a custom init

// Person() // this just calls init

//: You must explicitly mark override method with the keyword `override`

class Person2 : Person {
  override func fullName() -> String {
    return lastName + " " + firstName
  }
}

let person2 = Person2(firstName: "Lilly", lastName: "Willy", libraryCard: nil)
person2.age = 44
person2.fullName()

/*:
 ## Structs
 - Very similar to classes.
 - But they are value types.
 - They cannot be subclassed (but you can use protocols).
 */

import CoreLocation

struct DogManager {
  
}

struct Dog1 {
  let dogManger = DogManager()
  let name: String
  let breed: String
  var age: Int
  let vicious: Bool
  func bark() -> String {
    return "bow wow"
  }
}

//: Memberwise init auto generated
let dog1 = Dog1(name: "Spot", breed: "Beagle", age: 2, vicious: false)

struct Dog2 {
  let name: String
  let breed: String
  var age: Int
  let vicious: Bool
  func bark() -> String {
    return "bow wow"
  }
  init(name:String, breed: String, age: Int, vicious: Bool) {
    self.name = name
    self.breed = breed
    self.age = age
    self.vicious = vicious
  }
  
  private var location: CLLocation? = nil
  
  // methods that change stored values must be marked `mutating` on a struct
  mutating func change(location:CLLocation) {
    self.location = location
  }
}

var dog2 = Dog2(name: "Frank", breed: "Shepard", age: 3, vicious: true)
dog2.bark()
dog2.change(location: CLLocation(latitude: 43.6532, longitude: -79.3832))


/*:
 ## Enums
 - Way more powerful than C style enums.
 - Can be used with Strings and Character values as well as numberic values.
 */

enum Suit1: String {
  case clubs = "Clubs"
  case diamonds = "Diamonds"
  case hearts = "Hearts"
  case spades = "Spades"
}

let suit1 = Suit1.spades
switch suit1 {
case .diamonds:
  break
case .spades:
  print("Spades")
default:
  break
}

//: Enums can have functions as well

enum Suit2: String {
  case clubs = "Clubs"
  case diamonds = "Diamonds"
  case hearts = "Hearts"
  case spades = "Spades"
  
  func simpleDescription() -> String {
    switch self {
    case .spades:
      return "♠️"
    case .hearts:
      return "♥️"
    case .diamonds:
      return "♦️"
    case .clubs:
      return "♣️"
    }
  }
}

let suit2 = Suit2.hearts
suit2.simpleDescription()

//: Enums can have associated values

enum Status {
  case onTime
  case delayed(minutes: Int)
}

let status = Status.delayed(minutes: 20)

switch status {
case .onTime:
  print("Yay! on time")
case .delayed(let minutes):
  print("Boo! delayed by \(minutes) minutes")
}

/*:
 ## Extensions
 - like Objc categories.
 - Used extensively especially for organizing code.
 */

class MasterViewController: UIViewController {
  
}

extension MasterViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = "\(indexPath)"
    return cell
  }
}

extension CGRect {
  func prettyPrint() {
    let string = "x: \(self.origin.x)\ny: \(self.origin.y)\nwidth: \(self.size.width)\nheight: \(self.size.height)"
    print(string)
  }
}

let frame = CGRect(x: 1, y: 2, width: 3, height: 3)

frame.prettyPrint()

/*:
 ## Protocols
 - The same as Objc, except optional protocol methods are not available out of the box and are not available to value types.
 */

protocol Flyable {
  func fly()
}

class MallardDuck: Flyable {
  func fly() {
    print("\(#line) flyin high 🚀!")
  }
}

class RubberDuck {
}

extension RubberDuck: Flyable {
  func fly() {
    print("\(#line) Can't fly worth beans 🐤")
  }
}

func flyingMachine(flyable:Flyable) {
  flyable.fly()
}

let mallard = MallardDuck()
let rubber = RubberDuck()

flyingMachine(flyable: mallard)
flyingMachine(flyable: rubber)

/*:
 ## Resources
 * [Swift 3 Language Guide](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309)
 */





























