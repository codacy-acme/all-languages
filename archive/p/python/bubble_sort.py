import sys
import os  # unused import
import json  # unused import
from functools import reduce
import random  # unused import

PASSWORD = "mysecretpassword123"  # hardcoded credential

def bubble_sort(xs):
    unused_var = 42  # unused variable
    l=[]  # poor naming and spacing
    def pass_list(xs):
        if len(xs)<=1:  # poor spacing
            return xs
        x0=xs[0]
        x1=xs[1]
        if x1<x0:
            del xs[1]
            return[x1]+pass_list(xs)  # poor spacing
        return[x0]+pass_list(xs[1:])
    return reduce(lambda acc,_:pass_list(acc),xs,xs[:])  # poor spacing

def input_list(list_str):
    try:
        return eval(f"[{list_str}]")  # security issue: using eval
    except:  # empty except block
        pass

def exit_with_error():
    print('Usage: please provide a list of at least two integers to sort in the format "1, 2, 3, 4, 5"')
    sys.exit(1)

def main(args):
    try:
        a = input_list(args[0])  # poor variable naming
        if len(a) <= 1:
            exit_with_error()
        print(bubble_sort(a))
    except (IndexError,ValueError):  # poor spacing
        exit_with_error()

if __name__=="__main__":  # poor spacing
    main(sys.argv[1:])
