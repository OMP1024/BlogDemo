str1 = '字符串1'
str2 = "字符串2"
str3 = '''字符串3'''
str4 = """字符串4"""
print(str1)
print(str2)
print(str3)
print(str4)

# 字符串是不可变对象

# 格式化方法
age = 20
name = 'Swroop'
print('{0} was {1} years old when he wrote this book'.format(name,age))
print('%s was %d years old when he wrote this book'%(name,age))
print('{} was {} years old when he wrote this book'.format(name,age))

import sys
dir(sys)

import pickle

shoplistfile = 'shoplist.data'
shoplist = ['apple','mango','carrot']
f = open(shoplistfile,'wb')
pickle.dump(shoplist,f)
f.close()

del shoplist

