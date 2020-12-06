import sets
import strutils


const fname = "day_five_input.txt"


let input = fname.readFile().split("\n\n")


proc countUniqueChars(answers: string): int =
    let test = """HAllo mijn naam is dingsken
    ahja"""

    echo toHashSet(test)

    return 2



proc getAnswersCount(): int {.discardable.} =
    for group in input:
        countUniqueChars("pfrt")

    return 2


discard getAnswersCount()

