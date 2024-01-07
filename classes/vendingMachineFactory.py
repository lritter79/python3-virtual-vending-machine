from classes.vendingMachineRow import VendingMachineRow
from classes.gum import Gum
from classes.beverage import Beverage
from classes.snackFood import SnackFood
from classes.vendingMachineItem import VendingMachineItem
from classes.vendingMachineSlot import VendingMachineSlot
from classes.vendingMachine import VendingMachine


class VendingMachineFactory:
    @staticmethod
    def create_vending_machine(item_array):
        rows = {}
        for item in item_array:
            #make item
            item_to_add = None
            if (item["category"] == "gum"):
                item_to_add = Gum(item["name"], int(item["price"]), int(item["id"]))
            elif (item["category"] == "beverage"):
                item_to_add = Beverage(item["name"], int(item["price"]), int(item["id"]))
            elif (item["category"] == "snack"):
                item_to_add = SnackFood(item["name"], int(item["price"]), int(item["id"]))
            else: 
                item_to_add = VendingMachineItem(item["name"], int(item["price"]), int(item["id"]))
            #make slot
            item_slot = VendingMachineSlot(item_to_add, int(item["quantity"]), item["column"])
            #make row
            has_row = False
            for row in rows:
                if row == item["row"]:
                    has_row == True
            if has_row == False:
                new_row = VendingMachineRow(item["row"])
                rows.update({item["row"]: new_row})
            rows[item["row"]].add_slot(item_slot)
        #make vending machine
        machine = VendingMachine(rows)
        return machine
            
        

