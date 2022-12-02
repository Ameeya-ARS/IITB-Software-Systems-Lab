import numpy as np
import argparse
import matplotlib.pyplot as plt
import pandas as pd

parser = argparse.ArgumentParser(description="my script for path")
parser.add_argument('--path',help='Path for pca_data.txt')
parser.add_argument('--output',help='Path for output')
args = parser.parse_args()

df = pd.read_csv(args.path, delimiter=",", header=None)
df_normalized = df - df.mean()
arr = df.to_numpy()
rows = arr.shape[0]
columns = arr.shape[1]
new_arr_stdize = df_normalized.to_numpy()
arr_cov = np.cov(new_arr_stdize, rowvar=0)
eigen_val, eigen_vec = np.linalg.eig(arr_cov)
idx = eigen_val.argsort()[::-1]
eigen_val = eigen_val[idx]
eigen_vec = eigen_vec[:,idx]
row_in_eigen_vec = eigen_vec.shape[0]
def submatrix(matrix, startRow, row_size, startCol, col_size):
    return matrix[startRow:startRow+row_size,startCol:startCol+col_size]
eigen_matrix = submatrix(eigen_vec,0,row_in_eigen_vec,0,2)
final_matrix = np.dot(new_arr_stdize, eigen_matrix)
print(eigen_val)
np.savetxt(''.join([args.output,"transform.csv"]), final_matrix, delimiter=",")
x = submatrix(final_matrix,0,rows,0,1)
y = submatrix(final_matrix,0,rows,1,1)
x = x.flatten()
y = y.flatten()
plt.xlim([-15, 15])
plt.ylim([-15, 15])
plt.scatter(x,y)
plt.savefig(''.join([args.output,"out.png"]))
