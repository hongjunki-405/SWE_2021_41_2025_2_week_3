FROM ubuntu:22.04
RUN apt-get update && apt-get install -y python3 && rm -rf /var/lib/apt/lists/*

CMD ["python3", "-c", "\
def isHappy(n: int):\n\
    seen = set()\n\
    while n != 1 and n not in seen:\n\
        seen.add(n)\n\
        n = sum(int(d)**2 for d in str(n))\n\
    return n == 1\n\
\n\
print(isHappy(19))\n\
print(isHappy(2))\n\
"]
