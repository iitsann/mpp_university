def valid_ipv4?(ip)

  octets = ip.split('.')
  return false unless octets.length == 4


  octets.all? do |octet|
    octet.to_i.to_s == octet && (0..255).cover?(octet.to_i)
  end
end

# Tests
puts valid_ipv4?('190.165.0.0') # true
puts valid_ipv4?('259.120.230.901')   # false
puts valid_ipv4?('0.0.0.0')     # true
puts valid_ipv4?('160.0.0.01')   # false
puts valid_ipv4?('121.56.23.16')   # true
