def tower(n)
  # repeat
  # until all disks are on one peg

  a = n.downto(1).entries
  b = []
  c = []
  pegs = [a, b, c]

  loop do

    #   move smallest disk clockwise
    peg_with_smallest_disk = pegs.min_by { |peg| peg.last || Float::INFINITY }
    next_peg = pegs[pegs.index(peg_with_smallest_disk).succ % pegs.length]
    next_peg.push(peg_with_smallest_disk.pop)
    p a: a, b: b, c: c

    break if b.length == n || c.length == n

    #   move second disk to remaining peg
    peg_with_second_disk = (pegs - [next_peg]).min_by { |peg| peg.last || Float::INFINITY }
    remaining_peg = (pegs - [next_peg, peg_with_second_disk]).first
    remaining_peg.push(peg_with_second_disk.pop)

    p a: a, b: b, c: c
  end
end

tower(4)
