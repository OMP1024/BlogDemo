//
//  VideoCell.swift
//  TableView
//
//  Created by 王博 on 17/5/24.
//  Copyright © 2017年 NewsInPalm. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var contentLb: UILabel!
    
    var model: Model? {
        didSet{
            guard let model = model else { return }

            let head = "<iframe class='video_iframe' type='text/html' width='100%' height='100%' margin=0 padding=0 src=\(model.url) frameborder=0 allowfullscreen=0"
            webView.loadHTMLString(head, baseURL: nil)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
