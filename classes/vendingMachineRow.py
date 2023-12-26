class VendingMachineRow:
    def __init__(self, letter):
        self.letter = letter
        self.slot_dict = {}
    def add_slot(self, slot):
        self.slot_dict.update({slot.number:slot})
