import UIKit


// Basic
//1.
let Pi: Double = .pi

//2.
let x: Int = 5
let y: Int = 6
let average = (x + y) / 2

//3.

let _x = 5
let _y = 6
let recordSystem: Double = (Double(_x) + Double(_y)) / 2
// the result of ( 10 / 3 ) will be rounded down to an Int as 10 and 3 are both Int type, so the result will not show decimal point. The result of ( 10.0 / 3.0 ) will show decimal point since 10.0 and 3.0 are two Double types in the beginning

/*
 4.
   Swift is a very powerful language that can infer the data type for you     (Type inference) while we still need to know the basics well. Please change the following codes into
the one with the data type.
*/

var flag: Bool = true
var inputString: String = "Hello world"
let bitsInBite: Int = 8
let averageScore: Double = 86.8

/*
 5.
 Compound assignment operators are very useful when programming. Please create
 a salary as 22000, and use unary plus operator adding 28000 to salary, and it will
 be 50000 after this process.
*/

var salary = 22000
salary += 28000

/*
  6. Now please write down the Equality operator in swift
*/
let scoreA = 5
let scoreB = 5
scoreA == scoreB

// 7. Declare two constants that values are 10 and 3 each, then please calculate the remainder and save the result in a constant named remainder .

let valueA = 10
let valueB = 3
let remainder = valueA % valueB

/*
  8. Please explain the difference between let and var
 
 Once defining as let, the value can not be changed in the future whereas var is mutable variable.
*/


/*
  9. Please write down naming conventions and rules you learned in this session.
  
    1. if the function name is already clear enough to tell what it does, we can ignore the argument label by placing _ at front.
 
    2. make the function read more like a sentence by using the external paramerter. Ex: func printPassStatus(for grade: Int)
 
    3. if function body is only one line, we can ignore "return" key word
 
    4. Functions represent reusable tasks/actions of codes that do something, the action can be represented by a verb in a function name as it would be clearer to what the function does. like
 
       func printHighestGrade(_ grade1: Int, _grade2: Int) {
        print(grade1 >= grade2 ? grade1 : grade2)
    }
    
    5. use get/make/calculate + Noun to specify what the function will return
 
    Ex: getPonintsForCurrentRrund() , calculateAmountOff()
 
    6. stay consistent for naming
 
    7. When a compound type like Tuple that want to represent a optional value, we can be explicit about the type. Ex:
 
    let sam: (name: String, grade: Int, pet: String?) = (name: "Sam", grade: 99, pet: nil)
 
    8. Store a compound type for reuse using typealias. It is a light-weight type. It lets you give a name to a compound type or give an alternate name to a existing named type.
 
    typealias Student = (name: String, grade: Int, pet: String?)
 
    let same: Student = (name: "Sam", grade: 99, pet: nil)
 
    9. We can also use the type defined in typealias as parameter in functions
 
    Ex: func orderPetCollar(for student: Student) {
        // making sure the student has a pet
        guard let pet = student.pet else { return }
        print("One custom collar for \(student.name)'s pet, \(pet)")
    }
 
*/

/*
  10. What is Type Inference in swift?
 
    In swift, if you set a value on a variable, Swift can automatically infer the type of that value for you if you do not specify what the type is.
 
 For example: , Swift will infer number as Int type. However, if you say,  , then
*/
var number = 7 // this is a Int since 7 is a Int type
var floatNumber: Float = 7 // this is a Float. Swift knows you want the value type to be a Float type.


/*
 11.  What is the problem about this piece of code?
 
    var phoneNumber = 0987654321
    phoneNumber = "Hello world."
 
 Answer: We can not assign the variable of type Int to another type (String). When changing values, it has to be the same type.
*/


// Collection

// 1.  Please create an empty array with String data type and save it in a variable named myFriends
    
var myFriends: [String] = []

// 2.  According to Q1, now I have three friends, ‘Ian’, ‘Bomi’, and ‘Kevin’. Please help me to add their name into myFriends array

myFriends += [ "Ian", "Bomi", "Kevin"]

// 3. Oops,I forgot to add ‘Michael’ who is one of my best friends, please help me to add Michael to the end of myFriends array.

myFriends.append("Michael")

//4. Because I usually hang out with Kevin, please move Kevin to the beginning of the myFriends array.

myFriends.swapAt(0, 2)
myFriends

// 5. Use for…in to print all the friends in myFriends array.
for friend in myFriends {
    print(friend)
}

// 6. Now I want to know who is at index 5 in the myFriends array, try to find the answer for me. Please explain how you get the answer and why the answer is it.

// Answer: No one is at index 5 since there are four people in the array and the array index starts from 0

//let myfriendAtIndex5 = myFriends[5]

// 7. How to get the first element in an array?

let firstFrind = myFriends.first ?? ""

// 8. How to get the last element in an array?

let lastFrind = myFriends.last ?? ""

// 9. Please create a dictionary with keys of type String, value of type Int, and save it in a variable named myCountryNumber

var myCountryNumber: [String: Int] = [:]

// 10. Please add three keys ‘US’, ‘GB’, ‘JP’ with values 1, 44 , 81.

myCountryNumber["US"] = 1
myCountryNumber["GB"] = 44
myCountryNumber["JP"] = 81
myCountryNumber

// 11. Change the ‘GB’ value from 44 to 0.
myCountryNumber["GB"] = 0

// 12. How to declare an empty dictionary?
let dictionary1 = Dictionary<String, Int>()
let dictionary2: [String: Int] = [:]

// 13.  How to remove a key-value pair in a dictionary?

// Answer: set the key's value to nil or empty value will remove the whole key-value pair since the Dictionart can not find the value associated with the key
myCountryNumber["US"] = nil
myCountryNumber

// Control Flow

// 1. Here is an array:

let lottoNumbers = [10, 9, 8, 7, 6, 5]

for number in lottoNumbers where number <= 7 {
    print("Last three numbers are \(number)")
}

/*
    2. Please use swift syntax to get the result as images list below :
 
        5
        6
        7
        8
        9
        10
 
        10
        8
        6
 
 Please find a method which can help us complete these requirements
*/

let reversedLottoNumber = lottoNumbers.reversed()

reversedLottoNumber.forEach({ print($0) })

let evenLottoNumbers = lottoNumbers.filter({ $0 % 2 == 0 })
evenLottoNumbers.forEach({ print($0) })

// 3. Please use a while loop to solve the above question

var i = 0

while i <= lottoNumbers.count - 1 {
    
    if lottoNumbers[i]%2 == 0 {
        print("evenLottoNumbers in while loop is \(lottoNumbers[i])")
    }
    
    i += 1
}

// 4. Please use a repeat-while loop to solve question 2
var index = lottoNumbers.count - 1

repeat {
    print("reversed lotto number in repeat while loop: \(lottoNumbers[index])")
    index -= 1
}while index >= 0


index = 0

repeat {
    if lottoNumbers[index]%2 == 0 {
        print("even lotto number in repeat while loop: \(lottoNumbers[index])")
    }
    
    index += 1
} while index <= lottoNumbers.count - 1

// 5. What are the differences between while and repeat-while?

// Ans: while loop checks the condition before the loop code. repeat-while loop executes the first time first then checks the condition. So the main difference is when the condition is checked.

/*
 6. Here is the variable isRaining to record the weather. Please write a statement that if
 the weather is raining, print “It’s raining, I don’t want to work today.”, otherwise print
 “Although it’s sunny, I still don’t want to work today.”
*/

var isRaining = false
print(isRaining ? "It’s raining, I don’t want to work today." : "Although it’s sunny, I still don’t want to work today.")


// 7.

func getJobLevel(level: Int) -> String {
    switch level {
    case 1: return "Member"
    case 2: return "Team Leader"
    case 3: return "Manager"
    case 4: return "Director"
    default:
        return "We do not have this job"
    }
}

getJobLevel(level: 1)
getJobLevel(level: 3)
getJobLevel(level: 5)

// Function

// 1.

func greet(person: String) -> String {
    "Hello, \(person)"
}

greet(person: "Ray")

// 2.
func multuply(a: Int, b: Int = 10) {
    print(a*b)
}

multuply(a: 3)

/* 3.
 
  What’s the difference between argument label and parameter name in function ?
 
  Ans: The argument label is used when calling the function(external parameter). The parameter name is used in the implementation of the function(internal parameter).
 
 Example: func getDiscountedProducts(with products: [Product]) { codes } -> with is argument label and products us parameter
 
*/

/* 4.
 
 What are the return types in the following statements?
 
 func birthday( ) -> String {
 
 } -> return a String type
 
 func payment( ) -> Double {
 
 } -> return a Double type
 
*/

