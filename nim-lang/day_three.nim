import nimbench
import sequtils


const fname = "day_three_input.txt"
const tree_char = "#"[0]
const travel_x = 3

proc processData(): seq[string] =
    for line in fname.lines:
        result.add(line)


let flines: seq[string] = processData()


bench(firstAssFinement):
    proc traverseOnce(x: int, size: int): int =
        if x + travel_x > size:
            return x + travel_x - size - 1

        return x + travel_x

    proc isTree(x: int, line: string): bool =
        return line[x] == tree_char

    proc calculateTrees(): int{.discardable.} =
        var pos = 0
        for line in flines:
            if isTree(pos, line):
                inc(result)

            pos = traverseOnce(pos, high(line))

    discard calculateTrees()


bench(secondAssFinement):
    type
        Pos = tuple[x, y: int]

    const traversals: array[5, Pos] = [
        (1, 1),
        (3, 1),
        (5, 1),
        (7, 1),
        (1, 2),
    ]

    proc traverseOnce(pos: Pos, travel: Pos, size: int): Pos =
        if pos[0] + travel[0] > size:
            return (pos[0] + travel[0] - size - 1, pos[1] + travel[1])

        return (pos[0] + travel[0], pos[1] + travel[1])

    proc isTree(x: int, line: string): bool =
        return line[x] == tree_char

    proc calculateTrees(): int{.discardable.} =
        var pos = (0, 0)
        var tree_count: int

        var results: seq[int] = @[]

        for travel in traversals:
            pos = (0, 0)
            tree_count = 0

            while pos[1] <= high(flines):
                if isTree(pos[0], flines[pos[1]]):
                    inc(tree_count)

                pos = traverseOnce(pos, travel, high(flines[pos[1]]))

            results.add(tree_count)

        return results.foldl(a*b)

    discard calculateTrees()


runBenchmarks()
