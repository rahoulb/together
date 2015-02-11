when_creating_a Website, generate: { domain: -> { "#{8.random_letters}.example.com" } }
when_creating_a Section, generate: { website: -> { a_saved Website } }, auto_generate: [:name]
when_creating_a Page, generate: { section: -> { a_saved Section } }, auto_generate: [:title]
