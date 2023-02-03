c = int(input())
outputs = []


def calc(n1, n2, op):
  if op == '+':
    return n1 + n2
  elif op == 'x':
    return n1 * n2
  elif op == '-':
    return n1 - n2


for _ in range(c):
  raw = input().split(' ')
  n1 = int(raw[0])
  n2 = int(raw[2])
  op = raw[1]
  rs = int(raw[4])
  R = calc(n1, n2, op)

  if R > rs:
    d = R - rs
    output = 'E{}ou!'.format('r' * d)
    outputs.append(output)

  elif R < rs:
    d = rs - R
    output = 'E{}ou!'.format('r' * d)
    outputs.append(output)

  
for o in outputs:
  print(o)