import sets
import nimbench
import strutils


const fname = "day_six_input.txt"


let input = fname.readFile().split("\n\n")


proc getUniqueChars(text: string): HashSet[char] =
    return toHashSet(toLowerAscii(multiReplace(text, (" ", ""), ("\n", ""))))

proc countUniqueChars(answers: string): int =
    return getUniqueChars(answers).len


bench(firstAssFinement):
    proc getAnswersCount(): int {.discardable.} =
        for group in input:
            result += countUniqueChars(group)

    discard getAnswersCount()


proc countAnswersForGroup(group: string): int =
    for c in getUniqueChars(group):
        if group.count(c) == group.strip().split("\n").len:
            inc(result)

bench(secondAssFinement):
    proc getAnswersCount(): int {.discardable.} =
        for group in input:
            result += countAnswersForGroup(group)

    discard getAnswersCount()


runBenchmarks()
