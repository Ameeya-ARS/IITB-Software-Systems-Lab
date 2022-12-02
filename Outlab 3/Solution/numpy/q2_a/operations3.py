import numpy as np
import argparse

parser = argparse.ArgumentParser(description="my script for path")
parser.add_argument('--path',help='Path for matrix.csv')
args = parser.parse_args()

arr = np.genfromtxt(args.path, delimiter=",")
arr = arr.astype('int32')
arr2 = np.sort(arr)
arr1 = np.sort(arr, axis=0)
arr3 = arr.flatten()
arr4 = np.sort(arr3)
print(arr1)
print(arr2)
print(arr4)
