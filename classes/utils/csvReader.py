import csv

class CsvReader:
    @staticmethod
    def get_dicts_from_csv(file_path):
        list_of_dicts = []
        try:
            with open(file_path, mode='r', newline='') as file:
                # Create a CSV reader object that returns rows as dictionaries
                csv_reader = csv.DictReader(file)

                # Access data using column names
                for row in csv_reader:
                    # Each 'row' variable represents a row in the CSV file as a dictionary
                    # You can access individual values using column names
                    list_of_dicts.append(row)
        except FileNotFoundError:
            print(f"The file at the path '{file_path}' does not exist or is invalid.")
            # Handle the situation when the file is not found or the path is invalid
        return list_of_dicts