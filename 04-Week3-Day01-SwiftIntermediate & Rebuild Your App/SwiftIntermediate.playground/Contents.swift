import UIKit

//MARK: ARRAY

//Mendeklarasi Array
var accountToFollow = ["Indocomtech", "Plaza Ambarukmo", "Istana BEC", "Plaza Indonesia"]
accountToFollow[0]

//Menambahkan item baru
accountToFollow.append("Istana Boneka")


//Mengetahui jumlah item di dalam array
print("Jumlah akun : \(accountToFollow.count)")

//Menambahkan item baru di index tertentu di array
accountToFollow.insert("Istana Kaca", at: 3)

// Menghapus item pada index tertentu di array
accountToFollow.remove(at: 1)
print(accountToFollow)

// Looping
for item in accountToFollow {
    print(item)
}

//MARK: DICTIONARIES
var followers = [
    "bec": "Istana BEC",
    "pza": "Plaza Ambarukmo",
    "ipz": "Istana Plaza",
    "ikc": "Istana Kaca",
]

// Mengakses Dicitionaries
followers["bec"]

// Menambahkan item baru ke dalam dicitionaries
followers["pzi"] = "Plaza Indonesia"
print(followers)

// Mengetahui jumlah item di dictionaries
print("Jumlah akun \(followers.count)")

// Menghapus item di dalam dicitionaries
if let removedValue = followers.removeValue(forKey: "ipz") {
    print("Item \(removedValue) telah di hapus")
}else{
    print("Item tidak di tempukan")
}

// Menampilkan konten dari dictionaries
for (followersCode, followersName) in followers {
    print("\(followersCode): \(followersName)")
}

//MARK: FUNCTION

//Mendeklarasikan function
// Simple Function
func sendMessage(account: String) -> String {
    let message = "Hi, \(account). Salam kenal!"
    return message
}

print(sendMessage(account: "Nindi"))
print(sendMessage(account: "Jeany"))

// Function tanpa input parameter
func sendDirectMessage() -> String {
    return "Hello, Tara!"
}
print(sendDirectMessage())

// Function multiple input parameters
func sendPrivateMessage(username: String, isAlreadySent: Bool) -> String {
    if isAlreadySent {
        return sendMessage(account: username)
    }else{
        return "No yet"
    }
}

print(sendPrivateMessage(username: "Nezuko", isAlreadySent: true))
print(sendPrivateMessage(username: "Zidan", isAlreadySent: false))


// Function tanpa return value, itu dikenal dengan Void
func greet(somebody: String) {
   print("Hello, \(somebody)")
}
greet(somebody: "Dante")

func greetAgain(someone: String, from city: String) -> String {
    return "Hi \(someone) dari \(city), senang bisa bertemu di Jakarta"
}
print(greetAgain(someone: "Zidane", from: "Madrid"))

//MARK: - CLOSURES
//Closures : Function di dalam function
//Swift memungkinkan menjadikan function menjadi nilai dari suatu variable
let directMessage = {
    print(greetAgain(someone: "Jack", from: "China"))
}
directMessage()

//Closure bisa punya input parameter
let coffeeShop = { (brand: String, hour: Int) in
    return "I have already visiting \(brand) at \(hour) PM"
}
coffeeShop("Kopi Surgawi", 2)
