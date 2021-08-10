//
//  ConverterViewController.swift
//
//  Created by Sami Hatna on 27/06/2021.
//

import Cocoa

class MoviePadViewController: NSViewController {

    @IBOutlet weak var MainText: NSScrollView!
    @IBOutlet weak var AboutBTN: NSButton!
    @IBOutlet weak var QuitBTN: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        if let name = defaults.string(forKey: "SavedText") {
            MainText.documentView!.insertText("\(name)")
        }
    }
    
    @IBAction func showAbout(_ sender: Any) {
        guard let appDelegate = NSApplication.shared.delegate as? AppDelegate, let itemManager = appDelegate.statusItemManager else { return }
        itemManager.showAbout()
    }
    
    func changeAppearance() {
        if CurrentIndex == 1 {
            ApplyColours(TextBackground: NSColor.black, Text: NSColor.green, Border: NSColor.green, Outer: NSColor.black, Button: NSColor.black, ButtonFore: NSColor.green)
            QuitBTN.layer?.borderWidth = 1
            QuitBTN.layer?.borderColor = NSColor.green.cgColor
            AboutBTN.layer?.borderWidth = 1
            AboutBTN.layer?.borderColor = NSColor.green.cgColor
        }
        else if CurrentIndex == 2 {
            ApplyColours(TextBackground: NSColor(calibratedRed: 255/255, green: 253/255, blue: 150/255, alpha: 1.0), Text: NSColor.black, Border: NSColor.black, Outer: NSColor(calibratedRed: 255/255, green: 215/255, blue: 100/255, alpha: 1.0), Button: NSColor(calibratedRed: 255/255, green: 253/255, blue: 150/255, alpha: 1.0), ButtonFore: NSColor.black)
            MainText.contentView.layer?.borderWidth = 2
            QuitBTN.layer?.borderWidth = 2
            QuitBTN.layer?.borderColor = NSColor.black.cgColor
            AboutBTN.layer?.borderWidth = 2
            AboutBTN.layer?.borderColor = NSColor.black.cgColor
        }
        else if CurrentIndex == 3 {
            ApplyColours(TextBackground: NSColor(calibratedRed: 34/255, green: 34/255, blue: 34/255, alpha: 1.0), Text: NSColor(calibratedRed: 203/255, green: 62/255, blue: 89/255, alpha: 1.0), Border: NSColor(calibratedRed: 34/255, green: 34/255, blue: 34/255, alpha: 1.0), Outer: NSColor(calibratedRed: 203/255, green: 62/255, blue: 89/255, alpha: 1.0), Button: NSColor(calibratedRed: 34/255, green: 34/255, blue: 34/255, alpha: 1.0), ButtonFore: NSColor(calibratedRed: 203/255, green: 62/255, blue: 89/255, alpha: 1.0))
        }
        else {
            ApplyColours(TextBackground: NSColor.white, Text: NSColor.black, Border: NSColor(calibratedRed: 181/255, green: 176/255, blue: 174/255, alpha: 1.0), Outer: NSColor(calibratedRed: 241/255, green: 239/255, blue: 238/255, alpha: 1.0), Button: NSColor.gray, ButtonFore: NSColor(calibratedRed: 65/255, green: 65/255, blue: 65/255, alpha: 1.0))
            AboutBTN.isBordered = true
            AboutBTN.bezelStyle = .rounded
            AboutBTN.layer?.backgroundColor = NSColor(calibratedRed: 241/255, green: 239/255, blue: 238/255, alpha: 1.0).cgColor
            QuitBTN.isBordered = true
            QuitBTN.bezelStyle = .rounded
            QuitBTN.layer?.backgroundColor = NSColor(calibratedRed: 241/255, green: 239/255, blue: 238/255, alpha: 1.0).cgColor
        }
    }
    
    func ApplyColours (TextBackground: NSColor, Text: NSColor, Border: NSColor, Outer: NSColor, Button: NSColor, ButtonFore: NSColor) {
        let myTextView: NSTextView = MainText.documentView! as! NSTextView
        myTextView.backgroundColor = TextBackground
        myTextView.textColor = Text
        myTextView.insertionPointColor = Text        
        MainText.borderType = .noBorder
        MainText.contentView.wantsLayer = true
        MainText.contentView.layer?.borderWidth = 1
        MainText.contentView.layer?.borderColor = Border.cgColor
        self.view.wantsLayer = true;
        self.view.layer?.backgroundColor = Outer.cgColor
        AboutBTN.bezelStyle = .rounded
        AboutBTN.isBordered = false
        AboutBTN.wantsLayer = true
        AboutBTN.layer?.backgroundColor = Button.cgColor
        AboutBTN.titleTextColor = ButtonFore
        AboutBTN.layer?.borderWidth = 0
        QuitBTN.frame.size.height = 5
        QuitBTN.bezelStyle = .rounded
        QuitBTN.isBordered = false
        QuitBTN.wantsLayer = true
        QuitBTN.layer?.backgroundColor = Button.cgColor
        QuitBTN.frame.size.height = 5
        QuitBTN.titleTextColor = ButtonFore
        QuitBTN.layer?.borderWidth = 0
    }
    
    @IBAction func quit(_ sender: Any) {
        let myTextView: NSTextView = MainText.documentView! as! NSTextView
        let myText:String = myTextView.string
        
        let defaults = UserDefaults.standard
        defaults.set(myText, forKey: "SavedText")
        
        NSApplication.shared.terminate(self)
    }

}


extension NSButton {
 
    var titleTextColor : NSColor {
        get {
            let attrTitle = self.attributedTitle
            return attrTitle.attribute(NSAttributedString.Key.foregroundColor, at: 0, effectiveRange: nil) as! NSColor
        }
        
        set(newColor) {
            let attrTitle = NSMutableAttributedString(attributedString: self.attributedTitle)
            let titleRange = NSMakeRange(0, self.title.count)
 
            attrTitle.addAttributes([NSAttributedString.Key.foregroundColor: newColor], range: titleRange)
            self.attributedTitle = attrTitle
        }
    }
    
}

