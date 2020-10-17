//
//  ViewController.swift
//  Sample
//
//  Created by Vivek John on 17/10/20.
//  Copyright © 2020 developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PaymentTableViewCellDelegate {
    
    
    @IBOutlet var lblPhoneOne: UILabel!
    @IBOutlet var lblPhoneTwo: UILabel!
    
    @IBOutlet var listTableView: UITableView!
    
    @IBOutlet var constraintsTableViewHeight: NSLayoutConstraint!
    
    var rateArray: [String] = []
    let cellReuseIdentifier = "PaymentTableViewCell"
    let tableCellHeight = 85

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        setUpTableView()
    }

    private func setUpTableView() {
        self.listTableView.register(UINib.init(nibName: self.cellReuseIdentifier, bundle: nil), forCellReuseIdentifier: self.cellReuseIdentifier)
        rateArray = ["Rate", "Rate", "Rate", "Rate", "Rate", "Rate", "Rate", "Rate"]
        constraintsTableViewHeight.constant = CGFloat(rateArray.count*tableCellHeight)
        self.listTableView.reloadData()
    }
    
    private func callNumber(phoneNumber: String) {
        guard let url = URL(string: "telprompt://\(phoneNumber)"),
            UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    // MARK: - Button Action
    @IBAction func phoneButtonOneClicked(_ sender: Any) {
        callNumber(phoneNumber: "9847829727")
    }
    
    @IBAction func phoneButtonTwoClicked(_ sender: Any) {
        callNumber(phoneNumber: "9847829727")
    }
}

// MARK: - Table View
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell: PaymentTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? PaymentTableViewCell
        
        let payCell : PaymentTableViewCell
        if let cell = tableView.dequeueReusableCell(withIdentifier: PaymentTableViewCell.reuseIdentifier) as? PaymentTableViewCell {
          payCell = cell
        } else {
          payCell = PaymentTableViewCell()
        }

        //let rateString = rateArray[indexPath.row]
        payCell.delegate = self
        payCell.configurePaymentTableViewCell(currentIndex: indexPath.row)
        return payCell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rateArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "\(indexPath.row)", message: "Table Cell Clicked", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}

// MARK: - Delegate Callbacks
extension ViewController {
    func rateButtonClicked(count: Int) {
        let alert = UIAlertController(title: "\(count)", message: "Button Clicked", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}

