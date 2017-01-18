//
//  ViewController.swift
//  ControlFun
//
//  Created by wanghuiyong on 16/01/2017.
//  Copyright © 2017 MyOrganization. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameField: UITextField!
    @IBOutlet var numberField: UITextField!
    @IBOutlet var sliderLabel: UILabel!
    @IBOutlet var leftSwitch: UISwitch!
    @IBOutlet var rightSwitch: UISwitch!
    @IBOutlet var doSomethingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sliderLabel.text = "50"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func backgroundTap(sender: UIControl) {
        nameField.resignFirstResponder()
        numberField.resignFirstResponder()
    }
    @IBAction func sliderChanged(_ sender: UISlider) {
        let progress = lroundf(sender.value)
        sliderLabel.text = "\(progress)"
    }
    @IBAction func switchChanged(_ sender: UISwitch) {
        let setting = sender.isOn
        leftSwitch.setOn(setting, animated: true)
        rightSwitch.setOn(setting, animated: true)
    }
    @IBAction func toggleControls(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            leftSwitch.isHidden = false
            rightSwitch.isHidden = false
            doSomethingButton.isHidden = true
        } else {
            leftSwitch.isHidden = true
            rightSwitch.isHidden = true
            doSomethingButton.isHidden = false
        }
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        // 警告控制器, 继承自 UIViewController, 用来显示操作表单或警告视图
        let controller = UIAlertController(title: "Are you sure?", message: "from action sheet", preferredStyle: .actionSheet)
        // 为控制器中的按钮添加对象
        let yesAction = UIAlertAction(title: "Yes, I am sure!", style: .destructive, handler: {action in 
            let msg = (self.nameField.text?.isEmpty)!
            	? "You can breathe easy, everything went OK."
            	: "You can breathe easy, \(self.nameField.text), " + "everything went OK."
            // 警告视图
            let controller2 = UIAlertController(title: "Something was done", message: msg, preferredStyle: .alert)
            let destructiveAction = UIAlertAction(title: "Destructive", style: .destructive, handler: nil)
            let normalAction = UIAlertAction(title: "Whatever alert!", style: .default, handler: nil)
            let cancelAction = UIAlertAction(title: "Phew!", style: .cancel, handler: nil)
            
            controller2.addAction(destructiveAction)
            controller2.addAction(normalAction)
            controller2.addAction(cancelAction)
            self.present(controller2, animated: true, completion: nil)
        })
        let normalAction = UIAlertAction(title: "Whatever!", style: .default, handler: nil)
        let noAction = UIAlertAction(title: "No way!", style: .cancel, handler: nil)
        // 为控制器添加按钮
        controller.addAction(yesAction)
        controller.addAction(normalAction)
        controller.addAction(noAction)
        // 获取警告控制器的悬浮展示控制器
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
            ppc.permittedArrowDirections = .down
        }
        // 将警告控制器作为展示的控制器以显示操作表单
        present(controller, animated: true, completion: nil)
    }
}
