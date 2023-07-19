live_loop :a do
  play_chord chord :e3, (knit :minor7, 3, :minor, 4, :major, 1).tick
  sleep 1
end

live_loop :b do
  sample :drum_bass_hard, amp: 2
  sleep 3.5
end

live_loop(:c) do
  sleep (ramp 0.5, 1).tick
  sample :drum_cymbal_closed
end

live_loop :d do
  density 3 do
    sample :bd_haus
    sleep 0.75
  end
  sleep 0.25
end

live_loop :e do
  density 2 do
    sample :bd_haus
    sleep 0.75
  end
  sleep 0.25
end
