# Advent-of-code 2020
I'm going for the challenges in a new language for me, Nim-lang.  

## How to run
```bash
# Copy project
git clone https://github.com/bramver/advent-of-code-2020.git
cd advent-of-code-2020/nim-lang

# Install dependencies
pacman -S nim nimble
nimble install nimbench

# Start benchmark for file
nim c -r -d:release --opt:speed --threads:on day_X.nim
```