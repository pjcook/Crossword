//
//  String+Additions.swift
//  Crossword
//
//  Created by PJ on 07/04/2017.
//  Copyright © 2017 AKQA. All rights reserved.
//

import Foundation

extension String {
    func substring(to: Int) -> String {
        return self.substring(to: self.index(self.startIndex, offsetBy: to))
    }
    func characterAt(index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}
