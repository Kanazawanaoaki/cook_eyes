list_row = [10, 20, 30, 50, 80, 130]

f = open('list.txt', 'w')
for x in list_row:
    f.write(str(x) + "\n")
f.close()
