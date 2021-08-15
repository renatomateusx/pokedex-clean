//
//  Output.swift
//  pokedex-clean-arch
//
//  Created by Renato Mateus on 11/08/21.
//

import Foundation

class Output<V> {
  
  var value: V? = nil
  var error: Error? = nil
  
  init(value: V? = nil, error: Error? = nil) {
    self.value = value
    self.error = error
  }
  
  func isError() -> Bool {
    return self.error != nil
  }
  
  func isSuccess() -> Bool {
    return !isError()
  }
  
  func isEmpty() -> Bool {
    return self.value != nil
  }
}
