require "benchmark_driver"

Benchmark.driver do |x|
  x.prelude <<~'RUBY'
    HELLO_WORLD_BYTESTRING = "\x68\x65\x6c\x6c\x6f\x20\x77\x6f\x72\x6c\x64\x21"
    HELLO_WORLD_BYTEARRAY = [0x68, 0x65, 0x6c, 0x6c, 0x6f, 0x20, 0x77, 0x6f, 0x72, 0x6c, 0x64, 0x21]
    def hello_world_upcase_string
      upcased = ""
      HELLO_WORLD_BYTESTRING.each_byte do |byte|
        if 0x41 <= byte && byte <= 0x7a
          upcased << (byte - 0x20)
        else
          upcased << byte
        end
      end
      # puts upcased # => HELLO WORLD!
    end

    def hello_world_upcase_integer
      upcased = HELLO_WORLD_BYTEARRAY.map do |char|
        if 0x41 <= char && char <= 0x7a
          char - 0x20
        else
          char
        end
      end
      # puts upcased.map(&:chr).join # => HELLO WORLD!
    end
  RUBY
  x.report %{ hello_world_upcase_string }
  x.report %{ hello_world_upcase_integer }
end
