#!/usr/bin/swift

let operationList: [String] = ["+", "-", "*", "/"]
var isValid: Bool = false
var userOperation: String = ""
var numbers = [String]()


func initateCalculator(prompt: String, validateInput: (String) -> ()) {
    isValid = false
    repeat {
        print(prompt)
        if let input = readLine() {
            validateInput(input)
        }
    } while (!isValid)
}

func validateDecision(_ decision: String) {
    if (decision == "1") {
        // code to calculate an entire operation
    } else if (decision == "2") {
        initateCalculator(prompt: "What operation would you like to perform?", validateInput: validateOperation)
        initateCalculator(prompt: "Please enter the first number.", validateInput: validateNumber)
        initateCalculator(prompt: "Please enter the second number.", validateInput: validateNumber)
        calculate(numbers, userOperation)
        isValid = true
        restartCalculator()
    } else {
        print("Please enter a valid option (1 or 2).")
    }
}

func validateOperation(_ operation: String) {
    if (operationList.contains(operation)) {
        userOperation = operation
        isValid = true
    } else {
        print("That is not a valid operation.")
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
        print("The result is: \(number1 + number2).")
    case "-":
        print("The result is: \(number1 - number2).")
    case "*":
        print("The result is: \(number1 * number2).")
    case "/":
        print("The result is: \(number1 / number2).")
    default:
        print("Your calculator doesnt work.")
    }
}

func restartCalculator() {
    print("Want to calculate again (Y or N)?")
    
    if let userRestart = readLine() {
        if (userRestart.lowercased() == "y") {
            // code to restart the program
        } else {
            print("Exiting calculator")
        }
    }
}




initateCalculator(prompt: "Press [1] to enter the entire operation by yourself OR [2] to take it step by step [2].", validateInput: validateDecision)



















