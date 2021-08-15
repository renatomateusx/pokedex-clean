//
//  UseCaseDecorator.swift
//  pokedex-clean-arch
//
//  Created by Renato Mateus on 11/08/21.
//

import Foundation

class UseCaseDecorator<P,R>: UseCase<P, R> {
  var useCase: UseCase<P, R>
  
  init(useCase: UseCase<P, R>) {
    self.useCase = useCase
  }

  override func onError(error: Error) {
    useCase.onError(error: error)
  }

  override func execute(param: P?, output: @escaping (Output<R>) -> ()){
      useCase.execute(param: param, output: output)
  }

  override func onResult(output: Output<R>) {
    useCase.onResult(output: output)
  }
}
