//
//  UpdateViewController.swift
//  Shopping List
//
//  Created by XinyuMiao on 2017/4/3.
//  Copyright © 2017年 Xinyu Miao. All rights reserved.
//

import UIKit
import CoreData

protocol UpdateViewControllerDelegate {
    func addButtonPressed(title: String, imgName: String, price: Double, qty: Int32)
    func updateButtonPressed()
}

class UpdateViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var delegate: UpdateViewControllerDelegate?
    
    var updateitem: ItemEntity! = nil
    var updatepurchasedItems: ItemEntity! = nil
    var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var imgNames = ["drink", "meat", "vegetable", "fruit", "dessert", "other"]
    var itemType: String! = nil
    
    let alert = UIAlertController(title: "Oops!", message: "Please fill the form correctly.", preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
    }

    @IBOutlet weak var itemTypePickerView: UIPickerView!
    @IBOutlet weak var itemTitleLabel: UITextField!
    @IBOutlet weak var itemPriceLabel: UITextField!
    @IBOutlet weak var itemQtyLabel: UITextField!
    @IBAction func stepper(_ sender: UIStepper) {
        self.itemQtyLabel.text = Int(sender.value).description
    }
    @IBAction func updateButtonAction(_ sender: Any) {
        if updateitem == nil {
            addItem()
        }
        else if updateitem != nil {
            updateitem.title = itemTitleLabel.text
            updateitem.imageName = itemType
            updateitem.price = Double(itemPriceLabel.text!)!
            updateitem.quantity = Int32(itemQtyLabel.text!)!
            self.appDelegate.coreDataStack.saveContext()
            updateItem()
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemTypePickerView.delegate = self
        itemTypePickerView.dataSource = self
        itemTypePickerView.selectRow(3, inComponent: 0, animated: true)
        
        if updateitem != nil {
            itemTitleLabel.text = updateitem.title
            itemType = updateitem.imageName
            itemPriceLabel.text = String(updateitem.price)
            itemQtyLabel.text = String(updateitem.quantity)
        
            switch itemType {
            case "drink":
                itemTypePickerView.selectRow(0, inComponent: 0, animated: true)
            case "meat":
                itemTypePickerView.selectRow(1, inComponent: 0, animated: true)
            case "vegetable":
                itemTypePickerView.selectRow(2, inComponent: 0, animated: true)
            case "fruit":
                itemTypePickerView.selectRow(3, inComponent: 0, animated: true)
            case "dessert":
                itemTypePickerView.selectRow(4, inComponent: 0, animated: true)
            case "other":
                itemTypePickerView.selectRow(5, inComponent: 0, animated: true)
            default: break
            }
        }
        alert.addAction(OKAction)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imgNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imgNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        itemType = imgNames[row]
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addItem() {
        let itemTitle = itemTitleLabel.text
        var itemImgName = itemType
        let itemPrice = Double(itemPriceLabel.text!)
        let itemQty = Int32(itemQtyLabel.text!)
        
        if itemImgName == nil {
            itemImgName = "fruit"
        }
        
        if itemTitle == nil || itemPrice == nil || itemQty == nil {
            self.present(alert, animated: true, completion:nil)
        }else{
            delegate?.addButtonPressed(title: itemTitle!, imgName: itemImgName!, price: itemPrice!, qty: itemQty!)
        }
    }
    
    func updateItem() {
        delegate?.updateButtonPressed()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
