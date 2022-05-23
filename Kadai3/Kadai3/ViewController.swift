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
        
        guard let number1 = Int(textfield1.text ?? ""), let number2 = Int(textfield2.text ?? "") else {
            resultLabel.text = "数字を入力して下さい。"
            return
        }

        let signedNumber1: Int
        if switch1.isOn {
            signedNumber1 = -number1
        } else {
            signedNumber1 = number1
        }
        
        let signedNumber2: Int
        if switch2.isOn {
            signedNumber2 = -number2
        } else {
            signedNumber2 = number2
        }
        
        label1.text = signedNumber1.description
        label2.text = signedNumber2.description
        
        resultLabel.text = (signedNumber1 + signedNumber2).description
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
        
    }
    
}

