//
//  PopoverContentView.swift
//
//  Created by Sami Hatna on 27/06/2021.
//

import Cocoa

class PopoverContentView:NSView {
    var backgroundView:PopoverBackgroundView?
    override func viewDidMoveToWindow() {
        super.viewDidMoveToWindow()
        if let frameView = self.window?.contentView?.superview {
            if backgroundView == nil {
                backgroundView = PopoverBackgroundView(frame: frameView.bounds)
                backgroundView!.autoresizingMask = NSView.AutoresizingMask([.width, .height]);
                frameView.addSubview(backgroundView!, positioned: NSWindow.OrderingMode.below, relativeTo: frameView)
            }
        }
    }
}

class PopoverBackgroundView:NSView {
    override func draw(_ dirtyRect: NSRect) {
        if ArrowColor == "Matrix" {
            NSColor.black.set()
        }
        else if ArrowColor == "Bumblebee" {
            NSColor(calibratedRed: 255/255, green: 215/255, blue: 100/255, alpha: 1.0).set()
        }
        else if ArrowColor == "Plum" {
            NSColor(calibratedRed: 203/255, green: 62/255, blue: 89/255, alpha: 1.0).set()
        }
        else {
            NSColor(calibratedRed: 241/255, green: 239/255, blue: 238/255, alpha: 1.0).set()
        }
        self.bounds.fill()
    }
}
