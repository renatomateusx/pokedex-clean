//
//  SequenceUseCase.swift
//  pokedex-clean-arch
//
//  Created by Renato Mateus on 11/08/21.
//

import Foundation

class SequenceUseCase<T>: UseCase<Any,[Output<T>]> {
  
    let units: [UseCaseUnit<T, T>]
  
    private var stream: [Output<T>] = []

    func builder() -> Builder {
        return Builder()
    }

    override func execute(param: Any?) -> [Output<T>] {
        for(unit in units) {
            var output = unit.process()
            stream.add(output)
        }

        return ValueOutput(value: stream)
    }

    class Builder<T> {
      private var list: [UseCaseUnit<T, T>] = []
        func add<P,R>(useCase: UseCase<P,R>, param: P? = nil) -> Builder {
            list.add(UseCaseUnit(useCase, param))
            return self
        }

        func build() -> UseCase<Any, [Output<T>]> {
            return SequenceUseCase(list)
        }
    }
}
