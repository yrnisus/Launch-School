# i: text from a text file
# o:

words = {
  adjective: %w(quick lazy sleepy ugly),
  noun: %w(fox dog head leg),
  verb: %w(jumps lifts bites licks),
  adverb: %w(easily lazily noisily excitedly)
}

File.open('madlibs.txt') do |file|
  file.each do |line|
    puts line
       puts format(line, noun:      words[:noun].sample,
                      verb:      words[:verb].sample,
                      adjective: words[:adjective].sample,
                      adverb:    words[:adverb].sample)
  end
end
