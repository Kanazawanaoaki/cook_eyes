import matplotlib.pyplot as plt

f = open("./list.txt","r")
list_row = []

for x in f:
    list_row.append(int(x.rstrip("\n")))
f.close()

y = list_row
x = range(1,len(y)+1)

print(y)
print(x)

plt.plot(x, y)
plt.show()

