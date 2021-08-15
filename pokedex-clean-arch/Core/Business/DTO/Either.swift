//
//  Either.swift
//  pokedex-clean-arch
//
//  Created by Renato Mateus on 11/08/21.
//

import Foundation

struct Either<A,B> {
  var left: Left<A>? = nil
  var right: Right<B>? = nil
  
  init(left: Left<A>) {
    self.left = left
  }
  
  init(right: Right<B>) {
    self.right = right
  }
  
  func left(value: A) -> Either<A,B> {
    return Either(left: Left(value: value))
  }

  func right(value: B) -> Either<A,B> {
    return Either(right: Right(value: value))
  }
    
  func isLeft() -> Bool {
    return left != nil
  }
}

struct Left<A> {
  let value: A
}
struct Right<B>{
  let value: B
}
