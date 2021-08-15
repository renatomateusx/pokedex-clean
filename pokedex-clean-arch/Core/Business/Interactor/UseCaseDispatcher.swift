//
//  UseCaseDispatcher.swift
//  pokedex-clean-arch
//
//  Created by Renato Mateus on 11/08/21.
//

import Foundation

class UseCaseDispatcher<P, R> {
  var useCase: UseCase<P, R>
  var executeOn: DispatchQueue = DispatchQueue.global(qos: .background)
  var resultOn: DispatchQueue = DispatchQueue.main
  
  init(useCase: UseCase<P, R>, executeOn: DispatchQueue, resultOn: DispatchQueue) {
    self.useCase = useCase
    self.executeOn = executeOn
    self.resultOn = resultOn
  }
  
  func dispatch(param: P? = nil, job: @escaping () -> ()) {
    decorator.dispatch(param, job: job)
  }
}
private class DispatcherDecorator<P, R>: UseCaseDecorator<P, R> {
  init(useCase: UseCase<P, R>, executeOn: DispatchQueue, resultOn: DispatchQueue) {
    super.init(useCase: useCase, executeOn: executeOn, resultOn: resultOn)
  }
  
  func dispatch(param: P? = nil, result: @escaping () -> ()) {
    return GlobalScope.launch(executeOn) { process(param) }
  }
  
  override func onError(error: Throwable) {
    GlobalScope.launch(resultOn) { useCase.onError(error) }
  }
  
  override func onResult(output: Output<R>) {
    GlobalScope.launch(resultOn) { useCase.onResult(output) }
  }
}
