import UIKit


// Object-Oriented Swift
/*
 1. Declare a class Animal with property gender and method eat(). The data type of
 gender should be enum Gender as below and when you call eat() method, it will print
 I eat everything!
*/

class Animal {
    
    enum Gender {
        case male
        case female
        case undefine
    }
    
    let gender: Gender = .undefine
    
    func eat() {
        print("I eat everything!")
    }
}

let testAnimal = Animal()
testAnimal.eat()

/*
 2. Declare three classes: Elephant, Tiger, Horse that inherits from Animal and override
 the eat method to print what they usually eat.
*/

class Elephant: Animal {
    override func eat() {
        print("Elephant eats hay!")
    }
}

class Tiger: Animal {
    override func eat() {
        print("Tiger eats deers")
    }
}

class Horse: Animal {
    override func eat() {
        print("Horse eats grass")
    }
}

let elephant = Elephant()
elephant.eat()

let tiger = Tiger()
tiger.eat()

let horse = Horse()
horse.eat()

/*
 3. Declare a class Zoo with a property weeklyHot which means the most popular one in
 the zoo this week. The codes below can’t work correctly, please find what data type
 should A be and solve the problem. Note that tiger, elephant, and horse are
 instances of class Tiger, Elephant, and Horse, respectively.
*/

class Zoo {
    
    var weeklyHot: Animal
    
    init(weeklyHot: Animal) {
        self.weeklyHot = weeklyHot
    }
}

let zoo = Zoo(weeklyHot: Tiger())
let weeklyHotAnimalInZoo = zoo.weeklyHot
weeklyHotAnimalInZoo.eat()

zoo.weeklyHot = tiger
zoo.weeklyHot = elephant
zoo.weeklyHot.eat()
zoo.weeklyHot = horse

/*
 4. What’s the difference between Struct and Class ?

 Answer:
 1. Struct is value type and Class is reference type.
 
 2. An instance of a structure is a value. Class instance is object with identity.
 
 3. structures copy their values when used in new a place, but classes share their data.
 
 4. Class can inherite properties and methods from its parent class, also known as subclassing
 
 5. Struct has buit-in memberwise initializer, but class does not. Therefore, class has to manually initialize everything properties by ourselves.
 
 6. When a Struct method changes any of its properties, we are making a entirely new structure based on the original one. So, we have to mark the method as a mutating function, class does not.
 
 7. In order to change properties of Struct, both the instance and the property must be a variable, not constant. For class, when we declared the object as a constant, we can still modify any property of its object as long as it is marked as variable since Swift will see it as still the same object but with a new value.
*/


/*
 5. What’s the difference between instance method and type method ?
 
 Answer: instance method can only be used/called by an actual instance/object created from a class or struct. Type method can can called by the type directly.
*/

class Car {
    let brand: String = ""
    
    func drive() { print("drive") }
    
    static func park() { print("park") }
}

// Instance method
let car = Car()
car.drive()

// Type method
Car.park()


/*
 6. What does Initilizer do in class and struct ?
 
 Answer: initializer is used to initialize every property and create an actual instance of struct or class because Swift requires all properties have to be properly initailized (has a value) before creating the instance.
*/

/*
 7. What does self mean in an instance method and a type method ?
 
    self is a property on the instance that refers to itself. It's used to access class, structure and enumeration instance within methods. When self is accessed in a type method ( static func or class func ), it refers to the actual type (rather than an instance)
*/

/*
 8. What’s the difference between reference type and value type ?

 Answer: For value types, if we create a new instance copied from another instance, the new instance would be a copied version of the original one (completely independent), changing the new instance would not affect the original instance. We are creating an entirely new structure. However, for reference type, modifying the new instance would also affect the original instance since they have shared the same pointer to each other. It is always the same instance for class.
*/

// Enumerations and Optionals in Swift
/*
 1. There are several gasoline types, 92, 95, 98, and diesel that we can use enum to
 model them.

 ● Please create an enum named Gasoline to model gasoline.
 ● Every kind of gasoline has its price. Please create a method named getPrice
 in Gasoline enum that will return different prices depending on different
 gasoline.
 ● Please establish raw values for Gasoline. The data type of raw value should
 be String. For example, Gasoline.oil92.rawValue should be “92”.
 ● Please explain what enum associated value is and how it works.
 
 // enum associated value lets you associate values with each enum cases. The values for each case have their own data type and each case can have 0 or more associated values. We can also define the associated values with label names like function parameters. *Enumeration can only have rawValues or Associated values, but not both. When we want each case to have extra values to better represent their meaning, we can use associated values.
*/

enum Gasoline: String {
    case oil92 = "92"
    case oil95 = "95"
    case oil98 = "98"
    case diesel = "diesel"
    
    func getPrice() -> Double {
        switch self {
        case .oil92: return 100
        case .oil95: return 200
        case .oil98: return 300
        case .diesel: return 500
        }
    }
}

Gasoline.oil92.getPrice()
Gasoline.oil92.rawValue

/*
 2. Optional is a very special data type in Swift. Take var a: Int? = 10 for example, the
 value of a will be nil or Int. You should have learned how to deal with Optional.
 
 ● People would like to have pets, but not everyone could have one. Declare a
 class Pet with name property and a class People with pet property which will
 store a Pet instance or nil. Please try to figure out what data type is suitable
 for these properties in Pet and People.
 ● Please create a People instance and use guard let to unwrap the pet property.
 ● Please create another People instance and use if let to unwrap the pet
 property.
*/

class Pet {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

class People {
    
    let pet: Pet?
    
    init(pet: Pet) {
        self.pet = pet
    }
    
}

func getPet(for people: People) -> Pet {
    guard let pet = people.pet else { return Pet(name: "")}
    
    return pet
}

let people = People(pet: Pet(name: "lucky"))

let pet = getPet(for: people)
pet.name

func getPetUsingIflet(for people: People) -> Pet {
    if let pet = people.pet {
        return pet
    }
    
    return Pet(name: "")
}
let anotherPoeple = People(pet: Pet(name: "blacky"))
let pet2 = getPetUsingIflet(for: anotherPoeple)
pet2.name

// Protocol in Swift

/*
 1. Declare a struct Person with a name property type String and a protocol name
 PoliceMan. There is only one method arrestCriminals with no argument and return
 void in the protocol.
 
 2. Make struct Person conform to PoliceMan protocol.
 
 3. Declare a protocol ToolMan with a method fixComputer that has no argument and
 return void.
 
 4. Add a property toolMan to the struct Person with data type ToolMan.
 
 5. Declare a struct named Engineer that conforms to the ToolMan protocol.
 
 6. Create a Person instance with the name Steven and also create the relative data you
 need to declare this instance.
*/

protocol PoliceMan {
    func arrestCriminals()
}

protocol ToolMan {
    func fixComputer()
}


struct Person: PoliceMan {
    let name: String
    let toolMan: ToolMan
    
    func arrestCriminals() {
        
    }
}

struct Engineer: ToolMan {
    
    func fixComputer() {
        print("I can fix computer for free !!!")
    }
}

let slaveOfSteven = Engineer()
let steven = Person(name: "Steven", toolMan: slaveOfSteven)

steven.toolMan.fixComputer()


// Error Handling in Swift

enum GuessNumberGameError: Error {
    case wrongNumber
}

class GuessNumerGame {
    var targetNumber = 10
    
    func guess(number: Int) throws {
        guard number == targetNumber else {
            throw GuessNumberGameError.wrongNumber
        }
        print("Guess the right number: \(targetNumber)")
    }
    
}

let guessingGame = GuessNumerGame()

do {
    try guessingGame.guess(number: 20)
} catch {
    print(error)
}


