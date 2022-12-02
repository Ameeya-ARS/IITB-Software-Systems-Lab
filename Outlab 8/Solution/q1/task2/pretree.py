import os
import sys
sys.path.append(os.path.abspath(os.path.join(os.path.dirname("__file__"))))

import gdb
from utils import printBTree

class TreeNode:

    def __init__(self, data):
        self.left = None
        self.right = None
        self.value = data

    def insert(self, srcnode, leftORright, data):
        """
        Inserts a new node with the `data` to the left
        or right of the `srcnode` depending on the 
        `leftORright` being -1 or 1 respectively.
        """
        if leftORright == -1:
            srcnode.left = TreeNode(data)
        elif leftORright == 1:
            srcnode.right = TreeNode(data)

    def printTree(self):
        return printBTree(self, lambda n: (str(n.value), n.left, n.right), isTop=False)


class TreePrinter:
    def __init__(self, val):
        self.val = val

    def to_string(self):
        
        root = TreeNode(self.val['root']['data']) 
        Construct_Tree(source=self.val['root'],root=root)
        
        return '\n' + '\n'.join(root.printTree())


def Construct_Tree(source,root) :

    if source['left'] == 0x0 :
        pass
    else :
        root.left = TreeNode(source['left']['data'])
        Construct_Tree(source=source['left'],root=root.left)
    
    if source['right'] == 0x0 :
        pass
    else :
        root.right = TreeNode(source['right']['data'])
        Construct_Tree(source=source['right'],root=root.right)


def tree_printer(val):
    if str(val.type)=='tree':
        return TreePrinter(val)


gdb.pretty_printers.append(tree_printer)

