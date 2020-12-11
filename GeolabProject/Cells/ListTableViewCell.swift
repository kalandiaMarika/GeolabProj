

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    var contact: Contact? {
        didSet {
            self.titleLabel.text = contact?.name
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.contentView.backgroundColor = UIColor.clear
    }
    
}
