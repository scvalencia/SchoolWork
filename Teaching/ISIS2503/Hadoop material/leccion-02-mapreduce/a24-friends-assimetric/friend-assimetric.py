import MapReduce
import sys

mr = MapReduce.MapReduce()

# =============================
# Do not modify above this line

def mapper(record):
    # key: personA
    # value: personB
    # --- TU CODIGO AQUI ---
    # PISTA: EMITE DOS TUPLAS LLAMANDO DOS VECES A mr.emit_intermediate

def reducer(key, list_of_values):
    # --- TU CODIGO AQUI ---

# Do not modify below this line
# =============================
if __name__ == '__main__':
  inputdata = open(sys.argv[1])
  mr.execute(inputdata, mapper, reducer)
