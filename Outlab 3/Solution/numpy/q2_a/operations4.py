import numpy as np
import argparse

parser = argparse.ArgumentParser(description="my script for path")
parser.add_argument('--path',help='Path for matrix.csv')
args = parser.parse_args()

arr = np.genfromtxt(args.path, delimiter=",")
arr = arr.astype('int32')
arr_final, freq = np.unique(arr, return_counts=True)
print(arr_final)
print(freq)
pos = arr_final.size - 2
print(freq[pos])
