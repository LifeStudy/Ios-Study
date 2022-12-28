  //
  //  AddOrderViewController.swift
  //  CoffeeApp
  //
  //  Created by bruno araujo on 19/04/22.
  //

import Foundation
import UIKit

protocol AddCoffeOrderDelegate {
  func addCoffeeOrderViewControllerDidSave(order: Order, controller: UIViewController)
  func addCoffeeOrderViewControllerDidClose(controller: UIViewController)
}

class AddOrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  var delegate: AddCoffeOrderDelegate?

  private var vm = AddCoffeeOrderViewModel()
  @IBOutlet weak var tableView: UITableView!
  private var coffeSizesSegmentedControl: UISegmentedControl!
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  private func setupUI() {
    self.coffeSizesSegmentedControl = UISegmentedControl(items: self.vm.sizes)
    self.coffeSizesSegmentedControl.translatesAutoresizingMaskIntoConstraints = false

    self.view.addSubview(self.coffeSizesSegmentedControl)

    self.coffeSizesSegmentedControl.topAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 20).isActive = true

    self.coffeSizesSegmentedControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
  }

  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    tableView.cellForRow(at: indexPath)?.accessoryType = .none
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.vm.types.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeTypeCell", for: indexPath)

    cell.textLabel?.text = self.vm.types[indexPath.row]
    return cell
  }

  @IBAction func close(){
    if let delegate = delegate {
      delegate.addCoffeeOrderViewControllerDidClose(controller: self)
    }
  }

  @IBAction func save() {
    let name = self.nameTextField.text
    let email = self.emailTextField.text

    let selectedSize = self.coffeSizesSegmentedControl.titleForSegment(at: self.coffeSizesSegmentedControl.selectedSegmentIndex)

    guard let indexPathTypeCoffee = self.tableView.indexPathForSelectedRow else {
      fatalError("Error in selecting coffee!")
    }

    self.vm.name = name
    self.vm.email = email

    self.vm.selectedSize = selectedSize
    self.vm.selectedType = self.vm.types[indexPathTypeCoffee.row]

    Webservice().load(resource: Order.create(vm: self.vm)) { result in

      switch result {
        case .success(let order):
          if let order = order, let delegate = self.delegate {
            DispatchQueue.main.async {
              delegate.addCoffeeOrderViewControllerDidSave(order: order, controller: self)
            }
          }
        case .failure(let error):
          print(error)
      }
    }
  }
  
}
