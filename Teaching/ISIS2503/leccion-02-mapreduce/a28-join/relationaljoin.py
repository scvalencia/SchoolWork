import MapReduce
import sys

mr = MapReduce.MapReduce()

# =============================
# Do not modify above this line

def mapper(record):
   # ------------------
   # tu codigo aqui
   # ------------------

def reducer(key, list_of_values):
   # ------------------
   # tu codigo aqui
   # ------------------

# Do not modify below this line
# =============================
if __name__ == '__main__':
  inputdata = open(sys.argv[1])
  mr.execute(inputdata, mapper, reducer)
