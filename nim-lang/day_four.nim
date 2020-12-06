import re
import strutils

const fname = "day_four_input.txt"
const rules: seq[string] = @[
    "byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"
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
    for pp in passport.replace("\n", " ").split(" "):
        if pp.split(":")[0] == substr:
            return pp.split(":")[1]

proc isByr(passport: string): bool =
    let byr = getInformation(passport, "byr")
    var number = parseInt(byr)
    var output = (
        len(byr) == 4 and number >= 1920 and number <= 2002
    )

    if not output:
        echo "Passport failed for BYR test with number: ", number

    return output


proc isIyr(passport: string): bool =
    let iyr = getInformation(passport, "iyr")
    var number = parseInt(iyr)
    var output = (
        len(iyr) == 4 and number >= 2010 and number <= 2020
    )

    if not output:
        echo "Passport failed for IYR test with number: ", number

    return output

proc isEyr(passport: string): bool =
    let eyr = getInformation(passport, "eyr")
    var number = parseInt(eyr)
    var output = (
        len(eyr) == 4 and number >= 2020 and number <= 2030
    )

    if not output:
        echo "Passport failed for EYR test with number: ", number

    return output


proc isHgt(passport: string): bool =
    let hgt = getInformation(passport, "hgt")
    var number = parseInt(hgt[0..^3])
    var output = (
        (hgt[^2..^1] == "cm" and number >= 150 and number <= 193) or
        (hgt[^2..^1] == "in" and number >= 59 and number <= 76)
    )

    if not output:
        echo "Passport failed for HGT test with number: ", number

    return output

proc isHcl(passport: string): bool =
    var hcl = getInformation(passport, "hcl").strip()
    if hcl[0] != '#':
        return false
    var matchk = passport.find(re"#(?:[0-9a-fA-F]{3}){1,2}")
    var output = matchk != -1

    if output == false:
        echo "Passport failed for HCL test with haircolor: ", hcl
    else:
        echo "Passport worked for HCL test with haircolor: ", hcl

    return output

proc isEcl(passport: string): bool =
    let ecl = getInformation(passport, "ecl")
    var output = ecl in ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]

    if not output:
        echo "Passport failed for ECL test with eyecolor: ", ecl

    return output

proc isPid(passport: string): bool =
    let pid = getInformation(passport, "pid")
    var number = parseInt(pid)
    var output = (len(pid) == 9 and number >= 0)

    if not output:
        echo "Passport failed for PID test with : ", number

    return output


# var rerules: array[7, proc] = [isByr, isIyr, isEyr, isHgt, isHcl, isEcl, isPid]
proc isCompliant(passport: string): bool =
    for rule in rules:
        if rule notin passport:
            return false

    # for rerule in rerules:
    #     if not rerule(passport):
    #         return false

    # echo "\nStudying passport:\n", passport
    try:
        # if not isByr(passport):
        #     echo "Not isByr"
        # if not isIyr(passport):
        #     echo "Not isIyr"
        # if not isEyr(passport):
        #     echo "Not isEyr"
        # if not isHgt(passport):
        #     echo "Not isHgt"
        if isHcl(passport) == false:
            echo "Not isHcl"
        # if not isEcl(passport):
        #     echo "Not isEcl"
        # if not isPid(passport):
        #     echo "Not isPid"
    except Exception as e:
        echo "We have exc: ", e.msg
        return false

    return true

proc checkCompliantPassports(): int{.discardable.} =
    for passport in input:
        if isCompliant(passport): inc(result)

echo checkCompliantPassports()
