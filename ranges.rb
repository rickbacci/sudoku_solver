
def solve_for_rows(array, method)
    send(method, array, ([0]), (0..8), :row0)
    send(method, array, ([1]), (0..8), :row1)
    send(method, array, ([2]), (0..8), :row2)

    send(method, array, ([3]), (0..8), :row3)
    send(method, array, ([4]), (0..8), :row4)
    send(method, array, ([5]), (0..8), :row5)

    send(method, array, ([6]), (0..8), :row6)
    send(method, array, ([7]), (0..8), :row7)
    send(method, array, ([8]), (0..8), :row8)
end

def solve_for_columns(array, method)
    send(method, array, (0..8), [0], :col0)
    send(method, array, (0..8), [1], :col1)
    send(method, array, (0..8), [2], :col2)

    send(method, array, (0..8), [3], :col3)
    send(method, array, (0..8), [4], :col4)
    send(method, array, (0..8), [5], :col5) 

    send(method, array, (0..8), [6], :col6)
    send(method, array, (0..8), [7], :col7)
    send(method, array, (0..8), [8], :col8)
end

def solve_for_boxes(array, method)
    send(method, array, (0..2), (0..2), :box0)
    send(method, array, (0..2), (3..5), :box1)
    send(method, array, (0..2), (6..8), :box2)

    send(method, array, (3..5), (0..2), :box3)
    send(method, array, (3..5), (3..5), :box4)
    send(method, array, (3..5), (6..8), :box5)

    send(method, array, (6..8), (0..2), :box6)
    send(method, array, (6..8), (3..5), :box7)
    send(method, array, (6..8), (6..8), :box8)
end
