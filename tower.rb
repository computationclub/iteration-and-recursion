def tower(pegs)
  a, b, c = pegs
  n = a.length

  loop do
    peg_with_smallest_disk = pegs.min_by { |peg| peg.last || Float::INFINITY }
    next_peg = pegs[pegs.index(peg_with_smallest_disk).succ % pegs.length]
    next_peg.push(peg_with_smallest_disk.pop)
    p a: a, b: b, c: c

    break if b.length == n || c.length == n

    peg_with_second_disk = (pegs - [next_peg]).min_by { |peg| peg.last || Float::INFINITY }
    remaining_peg = (pegs - [next_peg, peg_with_second_disk]).first
    remaining_peg.push(peg_with_second_disk.pop)

    p a: a, b: b, c: c
  end
end

pegs = (a = [5, 4, 3, 2, 1], b = [], c = [])
tower(pegs)
