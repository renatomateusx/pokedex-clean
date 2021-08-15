//
//  CallbackDecorator.swift
//  pokedex-clean-arch
//
//  Created by Renato Mateus on 11/08/21.
//

import Foundation

class CallbackDecorator<P,R> : UseCaseDecorator<P,R> -> Unit {
  let useCase: UseCase<P,R>
  let callback: (Output<R>
  
  init(useCase: UseCase<P,R>, callback: Output<R>) {
    self.useCase = useCase
    self.callback = callback
  }
  override func onResult(output: Output<R>) {
      super.onResult(output)
      callback.invoke(output)
  }

  override func onError(error: Throwable) {
      super.onError(error)
      callback.invoke(ErrorOutput(error))
  }
}
