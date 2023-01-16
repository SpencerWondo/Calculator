//
//  ViewController.swift
//  Calculator
//
//  Created by Spencer Wondolowski on 12/27/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var CalculatorWorking: UILabel!
    @IBOutlet weak var CalculatorResults: UILabel!
    
    var workings:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        equalButton.layer.cornerRadius = 15
        equalButton.layer.masksToBounds = true
        
        clearAll()
    }
    
    func clearAll(){
        workings = ""
        CalculatorWorking.text = ""
        CalculatorResults.text = ""
    }

    @IBAction func allClear(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func equals(_ sender: Any) {
        if (validInput()){
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: workings)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            CalculatorResults.text = resultString
        } else {
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "Calculator unable to do math based on input",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() -> Bool{
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings{
            if(specialCharacter(char: char)){
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes {
            if(index == 0){
                return false
            }
            if(index == workings.count - 1){
                return false
            }
            if(previous != -1){
                if(index - previous == 1){
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharacter (char: Character) -> Bool{
        if (char == "*"){
            return true
        }
        if (char == "/"){
            return true
        }
        if (char == "+"){
            return true
        }
        return false
    }
    
    func formatResult(result: Double) -> String{
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        } else{
            return String(format: "%.2f", result)        }
    }
    
    @IBAction func backSpace(_ sender: Any) {
        if(!workings.isEmpty){
            workings.removeLast()
            CalculatorWorking.text = workings
        }
    }
    
    func addToWorkings(value: String){
        workings = workings + value
        CalculatorWorking.text = workings
    }
    
    @IBAction func percent(_ sender: Any) {
        addToWorkings(value: "%")
    }
    
    @IBAction func divide(_ sender: Any) {
        addToWorkings(value: "/")
    }
    
    @IBAction func times(_ sender: Any) {
        addToWorkings(value: "*")
    }
    
    @IBAction func minus(_ sender: Any) {
        addToWorkings(value: "-")
    }
    
    @IBAction func plus(_ sender: Any) {
        addToWorkings(value: "+")
    }
    
    @IBAction func decimal(_ sender: Any) {
        addToWorkings(value: ".")
    }
    
    
    
    @IBAction func zero(_ sender: Any) {
        addToWorkings(value: "0")
    }
    
    @IBAction func one(_ sender: Any) {
        addToWorkings(value: "1")
    }
    
    @IBAction func two(_ sender: Any) {
        addToWorkings(value: "2")
    }
    
    @IBAction func three(_ sender: Any) {
        addToWorkings(value: "3")
    }
    
    @IBAction func four(_ sender: Any) {
        addToWorkings(value: "4")
    }
    
    @IBAction func five(_ sender: Any) {
        addToWorkings(value: "5")
    }
    
    @IBAction func six(_ sender: Any) {
        addToWorkings(value: "6")
    }
    
    @IBAction func seven(_ sender: Any) {
        addToWorkings(value: "7")
    }
    
    @IBAction func eight(_ sender: Any) {
        addToWorkings(value: "8")
    }
    
    @IBAction func nine(_ sender: Any) {
        addToWorkings(value: "9")
    }
}

