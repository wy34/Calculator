#!/usr/bin/swift

class Calculator {
    let operationList: [String] = ["+", "-", "*", "/"]
    var isValid: Bool = false
    var userOperation: String = ""

    func runCalculator(prompt: String, task: (String) -> ()) {
        isValid = false
        repeat {
            print(prompt)
            if let input = readLine() {
                task(input)
            }
        } while (!isValid)
    }

    func chooseDecision(_ decision: String) {
        if (decision == "1") {
            // code to calculate an entire operation
        } else if (decision == "2") {
            runCalculator(prompt: "What operation would you like to perform?", task: validateOperation)
            runCalculator(prompt: "Please enter the first number.", task: validateNumber)
            runCalculator(prompt: "Please enter the second number.", task: validateNumber)
            calculate(numbers, userOperation)
        } else {
            print("Please enter a valid option (1 or 2).")
        }
        runCalculator(prompt: "Want to calculate again (Y or N)?", task: restartCalculator)
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

    func restartCalculator(restartDecision: String) {
        if (restartDecision.lowercased() == "y") {
            numbers.removeAll()
            runCalculator(prompt: "Press [1] to enter the entire operation by yourself OR [2] to take it step by step [2].", task: chooseDecision)
        } else {
            print("Exiting calculator")
            isValid = true
        }
    }
}


var numbers = [String]()

let calculator = Calculator()
calculator.runCalculator(prompt: "Press [1] to enter the entire operation by yourself OR [2] to take it step by step [2].", task: calculator.chooseDecision)






//print("Enter your operation (example: '1+2' or something more complex like '1+2-2/3').")
//
//if let equation = readLine() {
//    //equation.components(separatedBy: "")
//    print(equation)
//}













