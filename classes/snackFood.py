from classes.vendingMachineItem import VendingMachineItem as VendingMachineItemClass

class SnackFood(VendingMachineItemClass):
  def crunch(self):
      print("Crunch!")
  def useItem(self):
      self.crunch()