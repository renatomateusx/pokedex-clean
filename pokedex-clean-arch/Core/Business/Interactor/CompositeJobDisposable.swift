//
//  CompositeJobDisposable.swift
//  pokedex-clean-arch
//
//  Created by Renato Mateus on 11/08/21.
//

import Foundation

class CompositeJobDisposable {
  private var scheduler = DispatchQueue(label: "scheduler_dispatchers", attributes: .concurrent)
  private var executor = DispatchQueue(label: "executor_dispatchers", attributes: .concurrent)
    private var list: [(())] = []

    init() {
//        scheduler.scheduleAtFixedRate(::purge, 2, 2, TimeUnit.MINUTES)
    }

    func add(job: (())) {
      executor.async {
        job
      }
    }
}
