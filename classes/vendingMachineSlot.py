from classes.utils.receiptWriter import ReceiptWriter
from data.connect import vendItem
from psycopg2 import Error

class VendingMachineSlot:
    def __init__(self, item, number):
        self.number = number
        self.id = item.id
        self.item = item
    def vend_item(self):
        try:
            vendItem(self.id)
            ReceiptWriter.write_receipt(self.item.name, self.item.price)
            print("Enjoy Your " + self.item.name)
            self.item.useItem()
        except Error as e:
            print(e)

