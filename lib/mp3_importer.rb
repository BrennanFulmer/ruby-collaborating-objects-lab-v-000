
class MP3Importer
  attr_reader :path
  
  def initialize(file_path)
    @path = file_path
  end
  
  def files
    @files ||= Dir.glob("#{self.path}/*.mp3").collect{ |filename| filename.sub("#{self.path}/", '') }
      # .delete_prefix("#{self.path}/") - is better than .sub but I'm not risking updating from 2.3.1 to 2.5.x in the browser IDE
  end

  def import
    self.files.each { |file_name| Song.new_by_filename(file_name) }
  end

end

