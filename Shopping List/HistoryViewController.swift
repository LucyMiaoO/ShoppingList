//
//  HistoryViewController.swift
//  Shopping List
//
//  Created by XinyuMiao on 2017/4/3.
//  Copyright © 2017年 Xinyu Miao. All rights reserved.
//

import UIKit

protocol HistoryViewControllerDelegate {
    func getPurchasedItemsCount() -> Int
    func getPurchasedItemForRowAtIndexPath(indexPath: IndexPath) -> ItemEntity
    func unPurchasedItemAtIndexPath(indexPath: IndexPath)
    func historyTotallyPrice() -> Double
    func historyTotallyQty() -> Int
    func historyEtitle() -> String
    func historyEprice() -> Double
}

class HistoryViewController: UIViewController {

    @IBAction func closeButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var totallyPriceLabel: UILabel!
    
    @IBOutlet weak var totallyQtyLabel: UILabel!
    
    @IBOutlet weak var epitemNameLabel: UILabel!
    
    @IBOutlet weak var epitemPriceLabel: UILabel!
    
    var delegate: HistoryViewControllerDelegate?
    
    var totallyPrice: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self as? UITableViewDelegate
        totallyPriceLabel.text = String(delegate!.historyTotallyPrice())
        totallyQtyLabel.text = String(delegate!.historyTotallyQty())
        epitemNameLabel.text = delegate!.historyEtitle()
        epitemPriceLabel.text = String(delegate!.historyEprice())
    }
    
    func reloadView() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self as? UITableViewDelegate
        totallyPriceLabel.text = String(delegate!.historyTotallyPrice())
        totallyQtyLabel.text = String(delegate!.historyTotallyQty())
        epitemNameLabel.text = delegate!.historyEtitle()
        epitemPriceLabel.text = String(delegate!.historyEprice())
    }

}

extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.delegate != nil {
            return self.delegate!.getPurchasedItemsCount()
        }
        else {
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: ItemCell? = tableView.dequeueReusableCell(withIdentifier: "itemCell") as? ItemCell
        
        if cell == nil {
            cell = ItemCell(style: .default, reuseIdentifier: "itemCell")
        }
        
        if self.delegate != nil {
            let item: ItemEntity = self.delegate!.getPurchasedItemForRowAtIndexPath(indexPath: indexPath)
            cell!.itemTitleLabel.text = item.title
            cell!.itemImageView.image = UIImage(named: item.imageName!)
            cell!.itemPriceLabel.text = String(item.price)
            cell!.itemQtyLabel.text = String(item.quantity)
            cell!.itemPurchasedButton.setImage(UIImage(named: "switchON"), for: UIControlState.normal)
            cell!.delegate = self
        }
        
        cell!.selectionStyle = .none
        
        return cell!
    }
}

extension HistoryViewController: ItemCellDelegate {
    func buttonPressed(cell: UITableViewCell) {
        let indexPath: IndexPath? = self.tableView.indexPath(for: cell)
        if indexPath != nil {
            self.delegate?.unPurchasedItemAtIndexPath(indexPath: indexPath!)
            self.tableView.deleteRows(at: [indexPath!], with: .automatic)
            self.reloadView()
        }
    }
}

