//
//  ErrorOutput.swift
//  pokedex-clean-arch
//
//  Created by Renato Mateus on 11/08/21.
//

import Foundation

class ErrorOutput<V>: Output<V> {
  init(error: Error?, value: V? = nil) {
    super.init(value: value, error: error)
  }
  
  override func isError() -> Bool {
    return true
  }
}
