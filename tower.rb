def tower(pegs)
  peg_with_smallest_disk = pegs.min_by { |peg| peg.last || Float::INFINITY }
  next_peg = pegs[pegs.index(peg_with_smallest_disk).succ % pegs.length]
  next_peg.push(peg_with_smallest_disk.pop)
  p pegs

  return if pegs.count { |peg| peg.empty? } == pegs.length.pred

  peg_with_second_disk = (pegs - [next_peg]).min_by { |peg| peg.last || Float::INFINITY }
  remaining_peg = (pegs - [next_peg, peg_with_second_disk]).first
  remaining_peg.push(peg_with_second_disk.pop)

  p pegs

  tower(pegs)
end

pegs = (a = [5, 4, 3, 2, 1], b = [], c = [])
tower(pegs)
