def set_domain domain
  File.open(File.join(Rails.root, 'tmp', 'domain.txt'), 'w+') { | f | f.write domain }
end
