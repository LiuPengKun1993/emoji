//
//  ViewController.swift
//  emoji
//
//  Created by iOS on 16/10/17.
//  Copyright © 2016年 YMWM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewController(emojiVc)
        automaticallyAdjustsScrollViewInsets = false
        customTextView.inputView = emojiVc.view
        self.customTextView.font = UIFont.systemFontOfSize(20)
    }
    

    @IBAction func itemClick(sender: AnyObject) {
        print(self.customTextView.emojiAttributedText())
    }

    @IBOutlet weak var customTextView: UITextView!

    // MARK: - 懒加载
    // weak 相当于OC中的 __weak
    private lazy var emojiVc: EmojiViewController = EmojiViewController {
        [unowned self] (Emoji) -> () in
        self.customTextView.insertEmoji(Emoji, font: 20)
    }
   
    
    deinit {
        print("控制器销毁了")
    }
}

