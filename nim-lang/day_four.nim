import nre
import strutils

const fname = "day_four_input.txt"
const rules: seq[string] = @[
    "byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"
    #, "cid"
]
let input = fname.readFile().split("\n\n")

# bench(firstAssFinement):
#     proc isCompliant(passport: string): bool =
#         for rule in rules:
#             if rule notin passport:
#                 return false

#         return true

#     proc checkCompliantPassports(): int{.discardable.} =
#         for passport in input:
#             if isCompliant(passport): inc(result)

#     discard checkCompliantPassports()


proc getInformation(passport: string, substr: string): string =
    for pp in passport.split(" "):
        if pp.split(":")[0] == substr:
            return pp.split(":")[1]

proc isByr(passport: string): bool =
    let byr = getInformation(passport, "byr")
    return (
        len(byr) == 4 and
        parseInt(byr) >= 1920 and
        parseInt(byr) <= 2002
    )

proc isIyr(passport: string): bool =
    let tyr = getInformation(passport, "tyr")
    return (
        len(tyr) == 4 and
        parseInt(tyr) >= 2010 and
        parseInt(tyr) <= 2020
    )

proc isEyr(passport: string): bool =
    let eyr = getInformation(passport, "eyr")
    return (
        len(eyr) == 4 and
        parseInt(eyr) >= 2020 and
        parseInt(eyr) <= 2030
    )

proc isHgt(passport: string): bool =
    let hgt = getInformation(passport, "hgt")
    return (
        (hgt[^2..^1] == "cm" and
        parseInt(hgt[0..^2]) >= 150 and
        parseInt(hgt[0..^2]) <= 193) or

        (hgt[^2..^1] == "in" and
        parseInt(hgt[0..^2]) >= 59 and
        parseInt(hgt[0..^2]) <= 76)
    )

proc isHcl(passport: string): bool =
    var hcl = getInformation(passport, "hcl")
    for dink in hcl:
        if dink == "g"[0]:
            return false
        elif dink == "h"[0]:
            return false
        elif dink == "i"[0]:
            return false
        elif dink == "j"[0]:
            return false
        elif dink == "k"[0]:
            return false
        elif dink == "l"[0]:
            return false
        elif dink == "m"[0]:
            return false
        elif dink == "n"[0]:
            return false
        elif dink == "o"[0]:
            return false
        elif dink == "p"[0]:
            return false
        elif dink == "q"[0]:
            return false
        elif dink == "r"[0]:
            return false
        elif dink == "s"[0]:
            return false
        elif dink == "t"[0]:
            return false
        elif dink == "u"[0]:
            return false
        elif dink == "v"[0]:
            return false
        elif dink == "w"[0]:
            return false
        elif dink == "x"[0]:
            return false
        elif dink == "y"[0]:
            return false
        elif dink == "z"[0]:
            return false
        else:
            if dink != "a"[0] and dink != "b"[0] and dink != "c"[0] and dink !=
                    "d"[0] and dink != "e"[0] and dink != "f"[0]:
                if dink != "0"[0] and dink != "1"[0] and dink != "2"[0] and
                        dink != "3"[0] and dink != "4"[0] and dink != "5"[0] and
                        dink != "6"[0] and dink != "7"[0] and dink != "8"[0] and
                        dink != "9"[0]:
                    return false

    return true


proc isEcl(passport: string): bool =
    let ecl = getInformation(passport, "ecl")
    return ecl in ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]

proc isPid(passport: string): bool =
    let pid = getInformation(passport, "pid")
    return (pid.len == 9 and parseInt(pid) >= 0)


const rerules: array[7, proc] = [isByr, isIyr, isEyr, isHgt, isHcl, isEcl, isPid]
proc isCompliant(passport: string): bool =
    for rule in rules:
        if rule notin passport:
            return false

    for rerule in rerules:
        if not rerule(passport):
            return false

    return true

proc checkCompliantPassports(): int{.discardable.} =
    for passport in input:
        if isCompliant(passport): inc(result)

echo checkCompliantPassports()
