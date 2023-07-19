live_loop :t do
  sample :ambi_choir, rate: 0.2
  sample :bd_haus, rate: 1
  sleep 0.5
end

live_loop :boom do
  with_fx :reverb, room: 1 do
    sample :bd_boom, amp: 7, rate: 0.5, pitch: 7
  end
  sleep 4
end

live_loop :syn do
  play 45
  sleep 2
end

live_loop :syn1 do
  use_synth :square
  play 34, amp: 0.04, attack: 0.1, decay: 0.4, sustain: 0.6, sustain_level: 0.4, release: 0.1
  sleep 4
end

in_thread do
  live_loop :midi_piano do
    use_real_time
    note, velocity = sync "/midi:mpk_mini_mk_ii_0:1/note_on"
    synth :sine, note: note, amp: velocity / 127.0
  end
end
