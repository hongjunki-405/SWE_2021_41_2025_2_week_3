FROM ubuntu:22.04
RUN apt-get update && apt-get install -y python3 && rm -rf /var/lib/apt/lists/*

CMD ["python3", "-c", "\
def isHappy(n: int):\n\
    original = n\n\
    seen = set()\n\
    steps = []\n\
    while n != 1 and n not in seen:\n\
        seen.add(n)\n\
        digits = [int(d) for d in str(n)]\n\
        next_n = sum(d**2 for d in digits)\n\
        formula = ' + '.join(f'{d}²' for d in digits)\n\
        steps.append(f'{formula} = {next_n}')\n\
        n = next_n\n\
    print(f'Input: {original}')\n\
    print(f'Output: {n == 1}')\n\
    if n == 1:\n\
        print('Explanation:')\n\
        for step in steps:\n\
            print(step)\n\
\n\
print('--- Test 19 ---')\n\
isHappy(19)\n\
print('\\n--- Test 2 ---')\n\
isHappy(2)\n\
"]
