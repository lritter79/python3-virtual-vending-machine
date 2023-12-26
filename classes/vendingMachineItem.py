class VendingMachineItem:
    def __init__(self, name, price):
        self.name = name
        self.price = price
    def printNameAndPrice(self):
        print(self.name + ": " + self.price)
    def useItem(self):
        pass