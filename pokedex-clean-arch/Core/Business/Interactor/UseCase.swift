//
//  UseCase.swift
//  pokedex-clean-arch
//
//  Created by Renato Mateus on 11/08/21.
//

import Foundation

class UseCase<P, R> {
  open func process(param: P? = nil) {
    do {
      guard let param = param else { onGuardError() }
      try execute(param: param) { output in
        self.onResult(output: output)
      }
    } catch {
      onError(error: error)
    }
  }
  
  func execute(param: P? = nil, output: @escaping (Output<R>) -> ()) {
    fatalError("it must be implemented")
  }
  
  open func onError(error: Error)  {
    onResult(output: ErrorOutput(error: error))
  }
  
  open func onResult(output: Output<R>) {
    fatalError("it must be implemented")
  }
  
  open func onGuardError() {
    fatalError("it must be implemented")
  }
}
