//
//  Exceptions.swift
//  pokedex-clean-arch
//
//  Created by Renato Mateus on 11/08/21.
//

import Foundation

class AuthenticationException: NSException {
  
}

class InternetConnectionException: NSException {
  
}

class HttpException: NSException {
  init(code: Int, message: String = "") {
    fatalError("\(code) - \(message)")
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

class GuardException: NSException {
  init(message: String = "") {
    fatalError(message)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
