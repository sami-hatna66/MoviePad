//
//  StatusItemManager.swift
//
//  Created by Sami Hatna on 25/06/2021.
//

import Cocoa

class StatusItemManager: NSObject {
    
    var statusItem: NSStatusItem?
    var popover: NSPopover?
    var MoviePadVC: MoviePadViewController?
    
    override init() {
        super.init()
     
        initStatusItem()
        initPopover()
    }
    
    fileprivate func initStatusItem() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        let itemImage = NSImage(named: "Icon")
        itemImage?.isTemplate = true
        statusItem?.button?.image = itemImage
        
        statusItem?.button?.target = self
        statusItem?.button?.action = #selector(showMoviePadVC)
    }
    
    @objc fileprivate func showMoviePadVC() {
        guard let popover = popover, let button = statusItem?.button else { return }
        if MoviePadVC == nil {
                let storyboard = NSStoryboard(name: "Main", bundle: nil)
                guard let vc = storyboard.instantiateController(withIdentifier: .init(stringLiteral: "converterID")) as? MoviePadViewController else { return }
                MoviePadVC = vc
            }
        popover.contentViewController = MoviePadVC
        popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
        MoviePadVC?.changeAppearance()
    }
    
    fileprivate func initPopover() {
        popover = NSPopover()
        popover?.behavior = .transient
    }
    
    func showAbout() {
        guard let popover = popover else { return }
        
        popover.contentViewController?.view.isHidden = true
        
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateController(withIdentifier: .init(stringLiteral: "aboutID")) as? AboutViewController else { return }

        popover.contentViewController = vc
    }
    
    func hideAbout() {
        guard let popover = popover else { return }
        popover.contentViewController?.view.isHidden = true
        popover.contentViewController?.dismiss(nil)
        showMoviePadVC()
        popover.contentViewController?.view.isHidden = false
    }
}
