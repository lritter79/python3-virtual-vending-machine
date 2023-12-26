from classes.vendingMachineItem import VendingMachineItem as VendingMachineItemClass

class Beverage(VendingMachineItemClass):
  def drink(self):
      print("Gulp!")
  def useItem(self):
      self.drink()