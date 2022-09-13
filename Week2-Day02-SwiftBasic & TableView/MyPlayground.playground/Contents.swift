import UIKit
import Darwin

// Variable & Constant
//1.
let constant = 10.0
var y = 30
var x = y+Int(constant)
print(x)

//2
let greating = "Selamat datang"
let place = "Kopi Surgawi"
let content = "\(greating) di \(place)"
content.count
content.uppercased()
content.lowercased()

//3.
let coffeePrice = 25000
let amountCoffe = 5
let totalPrice = coffeePrice * amountCoffe
let billMessage = "Total : IDR \(totalPrice)"


// if statement
//1.
print("")
let timeToWakeUp = 8
timeToWakeUp < 6 ? print("Way to go") : print("Will be late")

//2.
print("")
let bloomingInterval = 45
switch bloomingInterval {
case 30:
    print("First interval and start pouring")
case 30..<90:
    print("Second interval, after then wait until thirty second")
case 90...180:
    print("Third interval, after then wait until twenty five second")
case 180...225:
    print("Resting interval and your coffee are ready to serve")
default:
    print("Over Resting")
}

//3. For in loops
//3.1.
print("")
let names = ["Anna", "Hendry", "Disa", "Wendy", "Ryan"]
for name in names {
    print("Halo selamat datang di kopi surgawi, \(name)")
}
print("")
for i in 0..<names.count {
    print("\(i+1). Halo selamat datang di kopi surgawi, \(names[i])")
}
print("")
names.forEach { name in
    print("Halo selamat datang di kopi surgawi, \(name)")
}

//3.2
print("")
let customerOrder: Dictionary<String, String> = [
    "Ryan":"Ice Coffee Surgawi",
    "Anna":"Vanilla Latte",
    "Disa":"Ice Americano",
    "Hendry":"Cold White",
    "Wndy":"Ice Japanese",
]

for(name, menu) in customerOrder {
    print("Pesanan \(menu) atas nama kak \(name) sudah ready!")
}
