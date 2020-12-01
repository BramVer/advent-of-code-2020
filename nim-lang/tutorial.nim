# This is a comment
echo "What's your name narc? "
# var name: string = readLine(stdin)
# echo "Hi, ", name, "!"


# var
#     x, y: int
#     # hello
#     a, b, c: string


# var x, y = 3 # Assigns 3 to both.
# echo "x, ", x
# echo "y, ", y

# x = 42 # Overwrites x
# echo "x, ", x
# echo "y, ", y

# const x = "abc"

const # Works like let, but needs to be set at compiletime
    x = 1
    y = 2
    z = y + 5

let # Works like const, but can be set at runtime
    u = "abc"
    # x = readLine(stdin)

let name = "bram"

if name == "":
    echo "No name????"
elif name == "name":
    echo "Haha very funny narc"
else:
    echo "Hi, ", name, "!"


case name
of "":
    echo "ait"
of "name":
    echo "sure"
of "DAb", "bram":
    echo "badass"
else:
    echo "Hi, ", name, "!"



from strutils import parseInt

echo "gib numberino pls"
let n = parseInt(readLine(stdin))

case n
of 0..2, 4..7:
    echo "Numer is in set {0, 1, 2, 4, 5, 6, 7}"
of 3, 8:
    echo "Number is 3 or 8"
else:
    discard # Means do nothing (like pass)



var naaame: string
while naaame == "":
    echo "please enter nambe"
    naaame = readLine(stdin)




echo "Counting to ten: "
for i in countup(1, 10):
    echo i # 1..10


echo "Counting to 5: "
var i = 1
while i <= 5:
    echo i
    inc(i) # += 1


for x in 0..<10:
    echo x # 0..9

var s = "some stringk"
for x in 0..<s.len:
    echo s[x]

for x, c in s[0..^1]:
    echo x, c, s[x]

let listjen = ["blah", "bleh", "bluh"]
for item in listjen.items:
    echo item

for idx, item in listjen.pairs:
    echo idx, item
