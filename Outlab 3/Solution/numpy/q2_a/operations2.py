import numpy as np
import pandas as pd
import argparse

parser = argparse.ArgumentParser(description="my script for path")
parser.add_argument('--path',help='Path for matrix.csv')
args = parser.parse_args()

df = pd.read_csv(args.path, delimiter=",", header=None)
arr = df.to_numpy()
mean = np.mean(arr,axis=0)
median = np.median(arr,axis=0)
sd = np.std(arr,axis=0)
np.set_printoptions(precision=2)
print(mean)
print(median)
print(sd)
np.set_printoptions(precision=8)
det = np.linalg.det(arr)
print(det)
np.set_printoptions(precision=2)
if(det==0):
    inverse=np.linalg.pinv(arr)
else:
    inverse=np.linalg.inv(arr)
print(inverse)
