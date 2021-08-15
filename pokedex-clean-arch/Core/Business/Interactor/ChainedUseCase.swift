//
//  ChainedUseCase.swift
//  pokedex-clean-arch
//
//  Created by Renato Mateus on 11/08/21.
//

import Foundation

class ChainedUseCase<P,R,T>: UseCase<P, T> {
    let first: UseCase<P, R>
    let second: UseCase<R, T>
  
  
    init(first: UseCase<P, R>, second: UseCase<R, T>) {
      self.first = first
      self.second = second
    }
  
  
    override func execute(param: P?): Output<T> {
        var intermediate = first.execute(param)
        if(intermediate.isSuccess()) {
            return second.execute(intermediate.value)
        }
        return ErrorOutput(intermediate.error)
    }
}
