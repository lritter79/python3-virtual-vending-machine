from classes.vendingMachineItem import VendingMachineItem
from classes.candy import Candy
from classes.vendingMachineSlot import VendingMachineSlot
from classes.vendingMachineRow import VendingMachineRow
from classes.vendingMachine import VendingMachine
from classes.vendingMachineFactory import VendingMachineFactory
from classes.utils.csvReader import CsvReader
from classes.utils.cursorReader import CursorReader
from data.connect import getItems
def main():
    rows = getItems()
    items = []
    for row in rows:
        items.append(CursorReader.get_dict_from_row(row))
    vendingMachine = VendingMachineFactory.create_vending_machine(items)
    #del current_directory
    #del file_path
    run = True
    print("Welcome to the Python Virtual Vending Machine. What would you like to do?")
    print("a: Display all items")
    print("b: Buy an item")
    print("c: Quit")

    while run == True: 
        val = str(input("a/b/c?: "))
        if val == "a":
            vendingMachine.printItems()
        elif val == "b":
            isVending = True
            while isVending:
                itemCode = str(input("Enter the item code: "))
                if len(itemCode) != 2:
                    print("Invalid Item Code")     
                else:
                    row = None
                    # try for unsafe code 

                try:
                    if itemCode[1].isdigit() == False:                     
                        raise ValueError("Invalid Second Character")
                except ValueError as e: 
                    print(e) 
                    continue

                try: 
                    if itemCode[0].upper() in vendingMachine.rows:
                        row = vendingMachine.rows[itemCode[0].upper()]
                    if row == None:
                        raise KeyError("Invalid Item Code")
                    else:
                        if int(itemCode[1]) in row.slot_dict:
                            row.slot_dict[int(itemCode[1])].vend_item()
                            isVending = False
                        else:
                            raise KeyError("Invalid Item Code")
                    # if false then raise the value error 
                except KeyError as e: 
                    print(e) 
        elif val == "c":
            print("Thank you, come again")
            run = False
        else:
            print("Sorry, I didn't understand that, could you please enter a, b, or c?")

main()