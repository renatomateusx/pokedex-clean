//
//  UseCaseUnit.swift
//  pokedex-clean-arch
//
//  Created by Renato Mateus on 11/08/21.
//

import Foundation

class UseCaseUnit<P,R> {
  var useCase: UseCase<P, R>
  var param: P?
  init(useCase: UseCase<P, R>, param: P?) {
    self.useCase = useCase
    self.param = param
  }
  
  func process() -> Output<R> {
    var callback = Callback<R>()
    var decorator = CallbackDecorator(useCase: useCase, callback: callback)
    decorator.process(param)
    return callback.output
  }
}

private class Callback<R> {
  var output: Output<R> = ValueOutput()
  func set(value: Output<R>) {
    output = value
  }
}
