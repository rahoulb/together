def file path, mode = 'r'
  File.open(File.join(Rails.root, "test", "fixtures", path), mode) { | f | f.read }
end
