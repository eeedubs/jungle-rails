require 'rails_helper'

RSpec.feature "Visitor navigates to product page", type: :feature, js: true do
    # SETUP

    before :each do
      @category = Category.create! name: 'Toys'

      10.times do |n|
        @category.products.create!(
          name: Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 22,
          price_cents: 127.99
        )
      end
    end

    # def 

    scenario "they click on a product to review its details" do
      # START AT HOMEPAGE
      visit root_path
      # PRINT OUT THE ROOT PATH URL
      puts "initial path: #{current_url}"
      
      # CLICK ON THE PRODUCT DETAILS LINK FOR THE FIRST PRODUCT
      first('article.product').click_link(class: 'pull-right')
      
      # WAIT 5 SECONDS
      sleep 5
      
      # PRINT OUT THE NEW PATH URL
      puts "new path: #{current_url}"

      # PRINT OUT THE NEW PATH'S HTML 
      puts page.body

      # TAKE A SCREENSHOT OF THE NEW PAGE
      save_screenshot
      
      # VERIFY THAT THE NEW PAGE HAS THE CORRECT CONTENT
      expect(page).to have_css "section.products-show"
    end
end
