import csv

class CursorReader:
    @staticmethod
    def get_dict_from_row(result):
        dict = {}
        try:
            dict.update({"name":result[0]})
            dict.update({"category":result[1]})
            dict.update({"row":result[2]})
            dict.update({"column":result[3]})
            dict.update({"quantity":result[4]})
            dict.update({"price":result[5]})
            dict.update({"id":result[6]})
        except:
            print("Invalid Result")
            # Handle the situation when the file is not found or the path is invalid
        return dict