class VendingMachine:
    def __init__(self, rows):
        self.rows = rows

    def printItems(self):
        for row_key in self.rows:
            for slot_key  in self.rows[row_key].slot_dict:
                print(row_key + str(slot_key) + ": " + self.rows[row_key].slot_dict[slot_key].item_name)
