import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak private var textfield1: UITextField!
    @IBOutlet weak private var switch1: UISwitch!
    @IBOutlet weak private var label1: UILabel!
    
    @IBOutlet weak private var textfield2: UITextField!
    @IBOutlet weak private var switch2: UISwitch!
    @IBOutlet weak private var label2: UILabel!
    
    @IBOutlet weak private var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textfields: [UITextField] = [textfield1, textfield2]
        textfields.forEach { $0.keyboardType = .numberPad }
        
        let switches: [UISwitch] = [switch1, switch2]
        switches.forEach { $0.isOn = false }
        
    }

    @IBAction func calculate() {
        
        guard var number1 = Int(textfield1.text ?? ""), var number2 = Int(textfield2.text ?? "") else {
            resultLabel.text = "数字を入力して下さい。"
            return
        }
        
        if switch1.isOn {
            number1 = -number1
        }
        
        if switch2.isOn {
            number2 = -number2
        }
        
        label1.text = number1.description
        label2.text = number2.description
        
        resultLabel.text = (number1 + number2).description
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
        
    }
    
}

