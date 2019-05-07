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
      %Q(ffmpeg -i #{input_path} -vf scale=300:-1 -r 15 -t 3 #{output_path})
      # %Q(ffmpeg -i #{input_path} -vf scale=250:-1 -t 3 -frames 60  #{output_path})
      # %Q(ffmpeg #{options.to_options} #{output_path} -i #{input_path})
    end
  end
end