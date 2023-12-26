from classes.utils.receiptWriter import ReceiptWriter

class VendingMachineSlot:
    def __init__(self, item, quantity, number):
        self.number = number
        self.item_name = item.name
        item_stack = []
        i = 0
        while i < quantity:
            item_stack.append(item)
            i = i + 1
        self.items = item_stack
    def vend_item(self):
        if len(self.items) > 0:
            item = self.items.pop()
            ReceiptWriter.write_receipt(item.name, item.price)
            print("Enjoy Your " + item.name)
            item.useItem()
        else:
            if (len(self.item_name)-1) == "s":
                print("Sorry, We're Out Of "+ self.item_name)
            else:
                print("Sorry, We're Out Of "+ self.item_name + "s")

