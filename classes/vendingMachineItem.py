class VendingMachineItem:
    def __init__(self, name, price, id):
        self.name = name
        self.price = price
        self.id = id
    def printNameAndPrice(self):
        print(self.name + ": " + self.price)
    def useItem(self):
        pass