N = int(input())

buf = []
prev = input() # The first input is stored in prev
c = 1 # Stores the count of prev

# Models the input every clk cycle
for _ in range(N-1):

    curr = input()

    if prev == curr:
        c += 1
    else: 

        if c > 2: # > 16 case will be handled in the input files
            buf.append("ESC")
            buf.append(c)
            buf.append(prev)
        else:
            for j in range(c):
                buf.append(prev)

        # Reset
        c = 1;
        prev = curr

    # Models output
    if len(buf) > 0:
        z = buf[0]
        buf.pop(0)
        print(z)


# Empty buffer at the end
for i in range(len(buf)):
    print(buf[i])