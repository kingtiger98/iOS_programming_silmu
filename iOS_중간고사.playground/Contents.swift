var x : String? = "Hi"//Hi지우고도 실습
print(x, x!)

if let a = x {
    print(a)
}

let b = x!.count
print(type(of:b),b)

let b1 = x?.count
print(type(of:b1),b1, b1!)

let c = x ?? ""
print(c)

