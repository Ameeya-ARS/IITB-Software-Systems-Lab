import re
import gdb


class Mat2DPrinter:
    def __init__(self, val,row,col):
        self.val = val
        self.row = row
        self.col = col

    def to_string(self):

        str_list = list()
        rows, cols = (int(self.row), int(self.col))
        
        str_list.append(f"ROWS: {rows}")
        str_list.append(f"COLUMNS: {cols}")

        for i in range(rows):
            temprow = ""  
            for j in range(cols):
                temprow += str(self.val[i][j]) + " "
            str_list.append(temprow)

        return '\n' + '\n'.join(str_list)


def array2d_printer(val):

    data_type = str(val.type) 
    L = re.findall("[0-9]+",data_type)

    if len(L)==2 :  
        return Mat2DPrinter(val,L[0],L[1])


gdb.pretty_printers.append(array2d_printer)
