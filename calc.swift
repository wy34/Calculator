#!/usr/bin/swift

let operationList: [String] = ["+", "-", "*", "/"]
var isValid: Bool = false
var userOperation: String = ""
var numbers = [String]()

func runCalculator(prompt: String, validateInput: (String) -> ()) {
    isValid = false
    repeat {
        print(prompt)
        if let input = readLine() {
            validateInput(input)
        }
    } while (!isValid)
}

func validateOperation(_ operation: String) {
    if (operationList.contains(operation)) {
        userOperation = operation
        isValid = true
    } else {
        print("That is not a valid operation")
    }
}

func validateNumber(_ number: String) {
    if (Double(number) != nil) {
        if (!numbers.isEmpty && userOperation == "/" && Double(number) == 0) {
            print("Cannot divide by zero!")
        } else {
            numbers.append(number)
            isValid = true
        }
    } else {
        print("This is not a number.")
    }
}

func calculate(_ numbers: [String], _ operation: String) {
    guard let number1 = Double(numbers[0]), let number2 = Double(numbers[1]) else { return }
    
    switch operation {
    case "+":
        print("The result is: \(number1 + number2)")
    case "-":
        print("The result is: \(number1 - number2)")
    case "*":
        print("The result is: \(number1 * number2)")
    case "/":
        print("The result is: \(number1 / number2)")
    default:
        print("Your calculator doesnt work")
    }
}

runCalculator(prompt: "What operation would you like to perform?", validateInput: validateOperation)
runCalculator(prompt: "Please enter the first number", validateInput: validateNumber)
runCalculator(prompt: "Please enter the second number", validateInput: validateNumber)
calculate(numbers, userOperation)













