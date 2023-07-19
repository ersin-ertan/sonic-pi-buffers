live_loop :beat do
  play :F2
  play :F1
  sleep 0.5
end

live_loop :heart do
  with_fx :reverb do
    sample :drum_bass_hard
    sleep 1
    sample :drum_cowbell, amp: 0.1
    sleep 1
  end
end

live_loop :hh do
  sleep 0.5
  sample :drum_cymbal_closed, amp:0.5
end

live_loop :test do
  times(:F,3)
  sleep 1
  times(:E,3)
  times(:A,3)
end

def times(note, co)
  co.times do
    play note
    sleep (1.0/co)
  end
end

live_loop :ch do
  with_fx :ping_pong do
    play_pattern [:F, :E, :A, :A, :E, :F], amp: 0.5
  end
  sleep 0.8
end
