from datetime import datetime

class ReceiptWriter:
    @staticmethod
    def write_receipt(name, price):
        file_path = 'receipt.txt'

        current_datetime = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        receipt_info = f"{current_datetime} - {name}: ${price}\n"

        with open(file_path, 'w') as file:
            file.write(receipt_info)
            print(f"Receipt for {name} with price ${price} has been written to {file_path}")

# # Example usage:
# name = "Product ABC"
# price = 50

# ReceiptWriter.write_receipt(name, price)
