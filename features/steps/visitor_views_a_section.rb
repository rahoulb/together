class Spinach::Features::VisitorViewsASection < Spinach::FeatureSteps
  step 'a web-site has been set up' do
    @website = a_saved Website, domain: 'mysite.example.com'
  end

  step 'the web-site has sections configured' do
    @news = a_saved Section, website: @website, name: 'News', description: '<h1>Important stuff</h1>', header_image: File.open(File.join(Rails.root, 'test', 'fixtures', 'header_image.jpg'))
    @articles = a_saved Section, website: @website, name: 'Articles'
  end

  step 'some pages are attaches to the sections' do
    @latest = a_saved Page, section: @news, title: 'Latest news item'
    @pages = []
    1.upto 20 do | n |
      Timecop.travel n.days.ago do
        @pages << a_saved(Page, section: @news)
      end
    end
  end

  step 'I visit a section' do
    set_domain 'mysite.example.com'
    visit "/s/#{@news.to_param}"
  end

  step 'I should see the section header' do
    within '.section-header' do
      page.has_content?('News').must_equal true
      page.has_css?('img').must_equal true
    end
  end

  step 'I should see the section description' do
    within '.section-header' do
      page.has_content?('Important stuff').must_equal true
    end
  end

  step 'I should see a list of pages with the newest first' do
    within '.pages' do
      page.has_content?('Latest news item').must_equal true
      0.upto 8 do | n | 
        page.has_content?(@pages[n].title).must_equal true
      end
    end
  end

  step 'I view the older pages' do
    click_link I18n.t(:older_pages, scope: 'front.section')
  end

  step 'I should see a list of older pages' do
    within '.pages' do
      9.upto 18 do | n | 
        page.has_content?(@pages[n].title).must_equal true
      end
    end
  end
end
