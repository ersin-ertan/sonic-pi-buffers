# Inspired from Francisco Aguado - Singularity https://www.youtube.com/watch?v=k7xZpvCXSlo&ab_channel=FloatingStation
live_loop :drone do
  play_chord [:A3, :D3], attack: 0.8, sustain: 2, amp:0.05
  sleep 3
end

drBs=0.5
drBa=0.1
pat=[:D2, :A1, :D1]
live_loop :drB do
  play_pattern_timed pat,[drBs], amp: 0.6
  sleep 3-drBs
end

with_fx :lpf, cutoff: 70  do
  with_fx :reverb do
    live_loop :b do
      3.times do
        sample :drum_bass_soft, amp: 1
        sleep 0.5
      end
      
      6.times do
        sleep 0.5
        sample :drum_bass_soft, amp: 1
        sleep 0.5
      end
      sleep 0.5
    end
  end
end

sleep 0.5
with_fx :lpf do
  with_fx :reverb, room:1 do
    live_loop :hh do
      sample :drum_cymbal_closed, amp:0.2
      sleep 1
    end
  end
end

=begin
# v1 attempt

bs=2

with_fx :reverb, room: 0.7 do
  with_fx :slicer, phase: 1/3.0, amp_min: 2/3.0 do
    live_loop :bt do
      play :D2
      sleep bs
      play :D3
      sleep bs
      play :A2
      sleep bs
      play :C3
      sleep bs
    end
end end

with_fx :lpf, cutoff: 110 do
  live_loop :ht do
    7.times do
      sample :drum_cymbal_closed, amp:0.25
      sleep 1
    end
    3.times do
      sample :drum_cymbal_closed, amp:0.25
      sleep 1/3.0
    end
  end
end
=end
