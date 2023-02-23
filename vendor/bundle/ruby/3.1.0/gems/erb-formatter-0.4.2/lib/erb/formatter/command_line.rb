
require 'erb/formatter'
require 'optparse'

class ERB::Formatter::CommandLine

  attr_reader :write, :filename, :read_stdin

  def initialize(argv, stdin: $stdin)
    @argv = argv.dup
    @stdin = stdin

    @write, @filename, @read_stdin, @code = nil

    OptionParser.new do |parser|
      parser.banner = "Usage: #{$0} FILENAME... --write"

      parser.on("-w", "--[no-]write", "Write file") do |value|
        @write = value
      end

      parser.on("--stdin-filename FILEPATH", "Set the stdin filename (implies --stdin)") do |value|
        @filename = value
        @read_stdin = true
      end

      parser.on("--[no-]stdin", "Read the file from stdin") do |value|
        if read_stdin == true && value == false
          abort "Can't set stdin filename and not use stdin at the same time"
        end

        @read_stdin = value
        @filename ||= '-'
      end

      parser.on("--print-width WIDTH", Integer, "Set the formatted output width") do |value|
        @width = value
      end

      parser.on("--[no-]debug", "Enable debug mode") do |value|
        $DEBUG = value
      end

      parser.on("-h", "--help", "Prints this help") do
        puts parser
        exit
      end

      parser.on("-v", "--version", "Show ERB::Formatter version number and quit") do
        puts "ERB::Formatter #{ERB::Formatter::VERSION}"
        exit
      end
    end.parse!(@argv)
  end

  def ignore_list
    @ignore_list ||= ERB::Formatter::IgnoreList.new
  end

  def ignore?(filename)

  end

  def run
    if read_stdin
      abort "Can't read both stdin and a list of files" unless @argv.empty?
      files = [
        [@filename, @stdin.read]
      ]
    else
      files = @argv.map do |filename|
        [filename, File.read(filename)]
      end
    end

    files.each do |(filename, code)|
      if ignore_list.should_ignore_file? filename
        print code unless write
      else
        html = ERB::Formatter.new(code, filename: filename, line_width: @width || 80)

        if write
          File.write(filename, html)
        else
          puts html
        end
      end
    end
  end
end
