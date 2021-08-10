//
//  AboutViewController.swift
//
//  Created by Sami Hatna on 27/06/2021.
//

import Cocoa

var CurrentIndex = 0
var ArrowColor = "System"

class AboutViewController: NSViewController {

    @IBOutlet weak var ThemeBox: NSComboBox!
    
    override func viewDidLoad() {
        ArrowColor = "System"
        super.viewDidLoad()
        ThemeBox.selectItem(at: CurrentIndex)
        self.view.wantsLayer = true;
        self.view.layer?.backgroundColor = NSColor(calibratedRed: 241/255, green: 239/255, blue: 238/255, alpha: 1.0).cgColor
    }
    
    @IBAction func dismissAbout(_ sender: Any) {
        CurrentIndex = ThemeBox.indexOfSelectedItem
        guard let appDelegate = NSApplication.shared.delegate as? AppDelegate, let itemManager = appDelegate.statusItemManager else { return }
        itemManager.hideAbout()
        switch ThemeBox.indexOfSelectedItem {
        case 1:
            ArrowColor = "Matrix"
        case 2:
            ArrowColor = "Bumblebee"
        case 3:
            ArrowColor = "Plum"
        default:
            ArrowColor = "System"
        }
    }
    
    
}
