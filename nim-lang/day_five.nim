import algorithm

const fname = "day_five_input.txt"
const rows = 127
const cols = 7


var flines: seq[string] = @[]
for line in fname.lines:
    flines.add(line)


type
    TravelPos = tuple[min, max: int]


proc travel(pos: TravelPos, dir: char): TravelPos =
    let middle = toInt((pos[1] - pos[0]) / 2) + pos[0]

    case dir
    of 'F', 'L':
        return (pos[0], middle)
    of 'B', 'R':
        return (middle, pos[1])
    else:
        discard

proc travelOverDirections(start: int, directions: string): int =
    var pos: TravelPos = (0, start)
    for dir in directions:
        pos = travel(pos, dir)

    return pos[0]

proc getRow(directions: string): int =
    travelOverDirections(rows, directions)


proc getColumn(directions: string): int =
    travelOverDirections(cols, directions)


proc getSeat(boardingPass: string): TravelPos =
    let row = getRow(boardingPass[0..^4])
    let col = getColumn(boardingPass[^3..^1])

    return (row, col)


proc getSeatID(boardingPass: string): int =
    let pos = getSeat(boardingPass)
    return pos[0] * 8 + pos[1]


proc getHighestSeatID(): int{.discardable.} =
    for bpass in flines:
        var seat = getSeatID(bpass)
        if seat > result:
            result = seat


proc getSeatsMap(): seq[int] =
    for bpass in flines:
        result.add(getSeatId(bpass))


proc getMySeat(): int{.discardable.} =
    var seats = getSeatsMap()
    sort(seats, system.cmp)

    for idx, seat in seats[1..^2].pairs:
        if seats[idx+2] - seat == 2:
            return seat + 1

echo getMySeat()
