import numpy as np
import argparse

parser = argparse.ArgumentParser(description="my script for path")
parser.add_argument('--path',help='Path for matrix.csv')
args = parser.parse_args()

arr = np.genfromtxt(args.path, delimiter=",")
arr = arr.astype('int32')

for i in range(0,5):
    for j in range(0,i):
        print(arr[j,i],end=" ")
    print(arr[i,i])
