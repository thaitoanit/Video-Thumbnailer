module VideoThumbnailer
  class GenerateCommand

    attr_reader :input_path, :output_path

    def initialize(in_path, out_path)
      @input_path = in_path
      @output_path = out_path
    end

    def generate_command options = {}
      options = VideoThumbnailer::Options.new(options)
      %Q(ffmpeg #{options.to_options} #{output_path} -i #{input_path})
    end

    def generate_command_gif options = {}
      options = VideoThumbnailer::Options.new(options)
      %Q(ffmpeg -i #{input_path} -vf -r 5 -t 00:00:10 #{output_path})
    end
  end
end