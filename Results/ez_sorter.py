# a terrible brute force way to get a list of values (with key) in disired order
def ez_sort(ListToSort,ListInOrder,index=0):
    Ordered = []
    for x in ListInOrder:
        i = 0 
        for y in ListToSort:
            if y[index] == x:
                Ordered.append(y)
            i = i + 1
    return Ordered


TESTCASE= ([1,2,3,4,5],[[2,11],[3,23],[1,32],[4,45]])
tc1 = [2,3,1,4]
tc2 = [11,23,32,45]

