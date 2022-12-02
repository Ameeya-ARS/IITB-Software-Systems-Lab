from scipy import integrate
import argparse

parser = argparse.ArgumentParser(description="my script for limits")
parser.add_argument('z_low',help='lower limit of z',type=float)
parser.add_argument('z_high',help='upper limit of z',type=float)
parser.add_argument('y_low',help='lower limit of y',type=float)
parser.add_argument('y_high',help='upper limit of y',type=float)
parser.add_argument('x_low',help='lower limit of x',type=float)
parser.add_argument('x_high',help='upper limit of x',type=float)
args = parser.parse_args()

function = lambda x , y , z : (x**2) * (y**2) * (z**2)
value = integrate.tplquad(function,args.z_low,args.z_high,args.y_low,args.y_high,args.x_low,args.x_high)
result = value[0]
print(result)
