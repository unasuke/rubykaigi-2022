import time

hello_world_bytes = b'hello world!'
count = 0
start = time.perf_counter()

while count < 10000:
  upcased = bytearray(b'')
  for b in hello_world_bytes:
    if 0x41 <= b and b <= 0x7a:
      upcased.append(b - 0x20)
    else:
      upcased.append(b)
    count += 1

end = time.perf_counter()

# print(upcased)
print(end - start)
