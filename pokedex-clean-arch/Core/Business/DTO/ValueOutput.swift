//
//  ValueOutput.swift
//  pokedex-clean-arch
//
//  Created by Renato Mateus on 11/08/21.
//

import Foundation

class ValueOutput<V>: Output<V> {
  
  init(value: V?) {
    super.init(value: value)
  }
  
  override func isError() -> Bool {
    return false
  }
}
