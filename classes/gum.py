from classes.vendingMachineItem import VendingMachineItem as VendingMachineItemClass

class Gum(VendingMachineItemClass):
  def chew(self):
      print("Pop!")
  def useItem(self):
      self.chew()