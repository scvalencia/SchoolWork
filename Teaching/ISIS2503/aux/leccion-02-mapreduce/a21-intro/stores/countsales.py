import MapReduce
import sys

mr = MapReduce.MapReduce()

# =============================
# Do not modify above this line

def mapper(record):
    date, time, store, item, cost, payment = record
    mr.emit_intermediate(store, cost)
    

def reducer(key, list_of_values):
    total = 0 
    for t in list_of_values:
        total += float(t)
    mr.emit((key, total))

# Do not modify below this line
# =============================
if __name__ == '__main__':
  inputdata = open(sys.argv[1])
  mr.execute(inputdata, mapper, reducer)
