import numpy as np
import argparse

parser = argparse.ArgumentParser(description="my script for path")
parser.add_argument('--path',help='Path for matrix.csv')
parser.add_argument('--num',help='Thickness of padding',type=int)
args = parser.parse_args()

num = args.num
arr = np.genfromtxt(args.path, delimiter=",")
arr = arr.astype('int32')
columns = arr.shape[1]
zeros_row = np.zeros((num,columns))
zeros_row = zeros_row.astype('int32')
arr1 = np.vstack([zeros_row,arr,zeros_row])
rows = arr1.shape[0]
zeros_column = np.zeros((rows,num))
zeros_column = zeros_column.astype('int32')
arr2 = np.hstack([zeros_column, arr1, zeros_column])
print(arr2)
