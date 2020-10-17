//
//  PaymentTableViewCell.swift
//  Sample
//
//  Created by Vivek John on 17/10/20.
//  Copyright © 2020 developer. All rights reserved.
//

import UIKit

protocol PaymentTableViewCellDelegate: class {
    func rateButtonClicked(count: Int)
}

class PaymentTableViewCell: UITableViewCell {
    static let reuseIdentifier = "PaymentTableViewCell"
    weak var delegate: PaymentTableViewCellDelegate?
    @IBOutlet var rateButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configurePaymentTableViewCell(currentIndex: Int) {
        self.rateButton.tag = currentIndex
    }
    
    @IBAction func rateButtonClicked(_ sender: UIButton) {
        self.delegate?.rateButtonClicked(count: sender.tag)
    }
}
