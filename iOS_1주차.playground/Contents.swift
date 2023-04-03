import UIKit


var optionalString: String? = "Hello, world!"
print(optionalString) // Optional("Hello, world!")

optionalString = nil
print(optionalString) // nil
// 위 예제에서 optionalString 변수는 String 타입의 옵셔널로 선언되었습니다. 초기값으로 "Hello, world!"를 할당했으므로 Optional("Hello, world!")가 출력됩니다. 이후 optionalString을 nil로 변경하면 nil이 출력됩니다.


var optionalName: String? = "John"

if let name = optionalName {
    print("Hello, \(name)!")
} else {
    print("Hello, anonymous!")
}
// 위 예제에서 optionalName 변수는 String 타입의 옵셔널로 선언되었습니다. 이후 if let 구문을 사용하여 optionalName 변수에 값이 있다면 name 상수에 할당하고, 없다면 else 구문을 실행합니다. 이를 통해 옵셔널 변수의 값이 존재하는지를 확인하고, 안전하게 값을 사용할 수 있습니다.
