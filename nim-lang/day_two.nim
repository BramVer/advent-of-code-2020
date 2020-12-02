import strutils
from sequtils import map


const fname = "day_two_input.txt"
const separator = ": "
const policy_separator = " "
const between_separator = "-"


proc isBetween(between: string, value: int): bool =
    let parsed = between.split(between_separator).map(parseInt)
    parsed[0] <= value and value <= parsed[1]


proc isValidPassword(between: string, substr: string, pwd: string): bool =
    isBetween(between, pwd.count(substr))


proc extractValidPasswords(): int =
    for line in fname.lines:
        let splitted = line.split(separator)
        let policy = splitted[0].split(policy_separator)

        if isValidPassword(policy[0], policy[1], splitted[1]):
            result += 1


echo extractValidPasswords()
