import UIKit


// 100 days check point for day 2
let degC = 30

var degF = ((degC * 9)/5) + 32

print("the temp is \(degC) C or \(degF) F")

let peopleList = ["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"]

let people = Set(peopleList)

print(people)
print(peopleList)
print(Set(peopleList))

print(peopleList.contains("Tom Cruise"))

enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday

print(day)

day = .friday

print(day)

let username: String
// lots of complex logic
username = "@twostraws"
// lots more complex logic
print(username)


var peop: [String] = peopleList
peop.append(contentsOf: ["Samuel L Jackson","Samuel L Jackson","wed"])

print(peopleList.count)
print(peop.count)
print(Set(peop).count)

let hour = 2
print(hour < 12 ? "It's before noon" : "It's after noon")

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}

for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

for i in 1...12 {
    print("The \(i) times table:")
    
    for j in 1...12 {
        print("  \(j) x \(i) is \(j * i)")
    }
    
    print()
}

let id = Int.random(in: 1...1000)

let amount = Double.random(in: 0...1)

// create an integer to store our roll
var roll = 0

// carry on looping until we reach 20
while roll != 20 {
    // roll a new dice and print what it was
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

// if we're here it means the loop ended – we got a 20!
print("Critical hit!")

let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }
    
    print("Found picture: \(filename)")
}

let number1 = 2
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)
        
        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)

// check point 3
for i in 1...100 {
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print("FizzBuzz")
    } else if i.isMultiple(of: 3){
        print("Fizz")
    } else if i.isMultiple(of: 5){
        print("Buzz")
    } else {
        print(i)
    }
}

func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

showWelcome()

func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)

// error handeling
enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

// checkpoint 4

enum boundError: Error {
    case under, over, noRoot
}

func squareRoot(num: Int) throws -> Int{
    if num > 10000 {
        throw boundError.over
    } else if num < 1 {
        throw boundError.under
    }
    
    for i in 1...100 {
        if i*i > num {
            throw boundError.noRoot
        } else if i*i == num {
            return i
        }
    }
    
    return 0
}

let thisNum = 50
do {
    let res = try squareRoot(num: thisNum)
    print("The squareroot of \(thisNum) is \(res)")
} catch boundError.over {
    print("\(thisNum) is OVER the limit of 10,000")
} catch boundError.under {
    print("\(thisNum) is UNDER the limit of 1")
} catch boundError.noRoot {
    print("\(thisNum) has no whole int root")
}

// Clouser Expressions

let sayHello = { (name: String) -> String in
    "Hi \(name)!"
}
// the keyword 'in' is used to mark the speration between the in/outputs  and the body of the function

sayHello("temp")

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}

let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)

// using a clouser

let captainFirstTeam1 = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
})

// cleaning up the clutter in the code above

let captainFirstTeam2 = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}

// reduce it even more
// swift can provide var names  name1 = $0 and name2 = $1
let captainFirstTeam3 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    
    return $0 < $1
}

let reverseTeam = team.sorted {
    return $0 > $1
}

// single line of code
let reverseTeam1 = team.sorted { $0 > $1 }
print(reverseTeam1)

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

// checkpoint 5
//input
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
// filter out even numbers
let filteredLN = luckyNumbers.filter { !($0.isMultiple(of: 2)) }
print(filteredLN)
// map to string
let mapedLN = filteredLN.map { "\($0) is a lucky number" }
//print string on new lines
for i in mapedLN {
    print(i)
}

// can be done on one go
let luckyNums = luckyNumbers.filter { !($0.isMultiple(of: 2)) } .map { "\($0) is a lucky number" }

for i in luckyNums {
    print(i)
}

// learning about structs
struct Employee {
    let name: String
    var vacationRemaining: Int
    
    // need to add the keyword 'matating' for fucntion to work since it may be used for a constant
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

//getters, setters, and computed values
struct Employee1 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            // cimputed value
            vacationAllocated - vacationTaken
        }
        
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer = Employee1(name: "Sterling Archer", vacationAllocated: 14)
archer.vacationTaken += 4 // getter
archer.vacationRemaining = 5 //setter
print(archer.vacationAllocated)

// will set and did set
// will is before the change
// did is after the change
struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
            // newvalue is a swift word used in will set
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
            // oldvalue is a swift word used in did set
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

// custom inits
struct Player {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Megan R")
print(player.number)


// access control types
/*
 
 Use private for “don’t let anything outside the struct use this.”
 Use fileprivate for “don’t let anything outside the current file use this.”
 Use public for “let anyone, anywhere use this.”

 */

// checkpoint 6

struct Car {
    let model:String
    let numSeats : Int
    
    private var gear : Int 
    
    init(carModel: String, seats: Int){
        self.model = carModel
        self.numSeats = seats
        gear = 0
    }
    
    mutating func gearUp() {
        if gear < 6 {
            gear += 1
            print("shifted up to \(gear)")
        } else {
            
            print("Top Gear")
        }
    }
    
    mutating func gearDn() {
        if gear < -1 {
            gear -= 1
            print("shifted down to \(gear)")
        } else {
            print("Neutral")
        }
    }
    
    func info() {
        print("This is a \(model) with \(numSeats) seats")
    }
}

var pine = Car(carModel: "elantra", seats: 4)
pine.info()
pine.gearDn()
pine.gearUp()
pine.gearUp()
pine.gearUp()
pine.gearUp()
pine.gearUp()
pine.gearUp()
pine.gearUp()
pine.gearUp()

//inheairiting in classes

class Employee2 {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee2 {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    // override keyword is needed for overwiting function inhearited from parent class
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

class Manager: Employee2 {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

let novall = Developer(hours: 8)
novall.printSummary()

joseph.printSummary()

// deinits
class User {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

// creating and destroying instances
for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
}

var users = [User]()

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")

//checkpoint 7
class Animal {
    var legs: Int
    
    init(legs: Int){
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() -> Void {
        print("Woof Woof")
    }
}

class Cat: Animal {
    var isTame: Bool
    
    init(legs: Int, tame: Bool) {
        self.isTame = tame
        super.init(legs: legs)
    }
    
    func speak() -> Void {
        print("Meow")
    }
}

class Corgi: Dog {
    override func speak() {
        print("roof roof")
    }
}

class Poodle: Dog {
    override func speak() {
        print("rouf rouf")
    }
}

class Persian: Cat {
    override func speak() {
        print("Purrr")
    }
}

class Lion: Cat {
    override func speak() {
        print("RAWR")
    }
}

let j = Corgi(legs: 4)
j.speak()

extension String {
    // the -ed means that it returns a new instance
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    // the lack of ed means that it changes itself
    mutating func trim() {
        self = self.trimmed()
    }
    
    // can add properties but ONLY computed properties
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

var quote = "   The truth is rarely pure and never simple   "

print(quote.trimmed())

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines)

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book {
    // can make a extenstion init function and retain the structs init
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
    
    func printInfo() {
        print("\(self.title) has \(self.pageCount) pages")
    }
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)
lotr.printInfo()

let harryPotter = Book(title: "Harry potter and the ...", pageCount: 222)
harryPotter.printInfo()

// potocals extensitons

struct User3: Equatable, Comparable {
    let name: String
    
    static func <(lhs: User3, rhs: User3) -> Bool {
        lhs.name < rhs.name
    }
}

let user1 = User3(name: "Taylor")
let user2 = User3(name: "Adele")
print(user1 < user2)

print(user1 <= user2)
print(user1 > user2)
print(user1 >= user2)

// checkpoint 8
protocol Building {
    var numRooms: Int {get set}
    var cost: Int {get set}
    var agentName: String {get set}
    var name: String {get set}
}

extension Building {
    func summary() -> Void {
        print("\(name)'s agent is \(agentName). the property has \(numRooms) rooms and costs $\(cost).")
    }
}

struct House: Building{
    var numRooms: Int = 4
    var cost: Int = 55000
    var agentName: String = "Arny"
    var name: String = "1123 Est est"
}

struct Office: Building{
    var numRooms: Int = 4
    var cost: Int = 55_000
    var agentName: String = "Arny II"
    var name: String = "2223 est"
}

let estHouse = House()
let estOffice = Office()

estHouse.summary()
estOffice.summary()

print(estOffice)

// optionals and nils
// handeling missing data with optionals
let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]

// if let
if let marioOpposite = opposites["Mario"] {
    print(marioOpposite)
}

// using the '?' - optionals
// nil != "", the nil means that there is nothing there DNE where as  the "" means that there is an empty string

var username1: String? = nil

// the username = username 1 unwraps the optionals
if let username = username1 {
    print("\(username)")
} else {
    print("No user name Avaliable")
}

// shadowing
var number: Int? = nil
// the number on the lhs only exists in the scope of the if statement
if let number = number {
    print(number)
}

// guards
/*
 guard is designed exactly for early return style of programming, and in fact does two things to help:

   1.  If you use guard to check a function’s inputs are valid, Swift will always require you to use return if the check fails.
   2.  If the check passes and the optional you’re unwrapping has a value inside, you can use it after the guard code finishes.

 */
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")

        // 1: We *must* exit the function here
        return
    }

    // 2: `number` is still available outside of `guard`
    print("\(number) x \(number) is \(number * number)")
}
/*
 use IF LET to unwrap optionals so you can process them somehow, and use GUARD LET to ensure optionals have something inside them and exit otherwise.
 */

// nil coalesing
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

// nil coalescing operator = '??' with the default on the RHS
let new = captains["Serenity"] ?? "N/A"


struct Book1 {
    let title: String
    let author: String?
}

var book: Book1? = nil

let author = book?.author?.first?.uppercased() ?? "A"
/*
 So, it reads “if we have a book, and the book has an author, and the author has a first letter, then uppercase it and send it back, otherwise send back A”.
 */

print(author)

// checkpoint 9


func getRandom(array: [Int]?) -> Int{
    return array?.randomElement() ?? Int.random(in: 1...100)
}

let arr = [1, 3, 4, 5, 6, 6]
let empty: [Int]? = nil

print("Random number from int array: \(getRandom(array: arr))")
print("Random number from nil array: \(getRandom(array: empty))")


// completed the basics of swift on 2021-12-01
// continuing with project based milestones
