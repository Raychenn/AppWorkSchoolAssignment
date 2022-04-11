import UIKit

var isOdd: (_ number: Int) -> Bool = { number in
    return number%2 != 0
}

isOdd(7)
