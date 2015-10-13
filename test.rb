def testa(skip)
  caller(skip)
end

def b(skip)
  a(skip)
end

def c(skip)
  b(skip)
end

p "Test"
print "Test"

 # testa(1)