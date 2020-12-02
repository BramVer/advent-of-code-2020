import strutils
import nimbench
from sequtils import map


const fname = "day_two_input.txt"
const separator = ": "
const policy_separator = " "
const positions_separator = "-"


var flines: seq[string] = @[]
for line in fname.lines:
    flines.add(line)


bench(firstAssignment):
    proc isBetween(between: string, value: int): bool =
        let parsed = between.split(positions_separator).map(parseInt)
        parsed[0] <= value and value <= parsed[1]


    proc isValidPassword(between: string, substr: string, pwd: string): bool =
        isBetween(between, pwd.count(substr))


    proc extractValidPasswords(): int{.discardable.} =
        for line in flines:
            let splitted = line.split(separator)
            let policy = splitted[0].split(policy_separator)

            if isValidPassword(policy[0], policy[1], splitted[1]):
                result += 1


    discard extractValidPasswords()



bench(secondAssignment):
    proc isCharAtPosInString(subchar: char, pos: int, value: string): bool =
        pos - 1 >= low(value) and pos - 1 <= high(value) and value[pos - 1] == subchar

    proc isValidPassword(positions: string, subchar: char, pwd: string): bool =
        let parsed = positions.split(positions_separator).map(parseInt)
        isCharAtPosInString(subchar, parsed[0], pwd) xor isCharAtPosInString(
                subchar, parsed[1], pwd)


    proc extractValidPasswords(): int{.discardable.} =
        for line in flines:
            let splitted = line.split(separator)
            let policy = splitted[0].split(policy_separator)

            if isValidPassword(policy[0], policy[1][0], splitted[1]):
                result += 1


    discard extractValidPasswords()


runBenchmarks()
