require 'rails_helper'

RSpec.feature "User adds a product to the cart", type: :feature, js: true do
  
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  
  
  scenario "They see a product and add it to their cart" do
    
    # GO TO HOME PAGE
    visit root_path
    
    # TAKE A SCREENSHOT OF THE HOME PAGE
    save_screenshot

    # CLICK THE 'ADD TO CART' BUTTON WITHIN THE FIRST PRODUCT
    first('article.product').click_button(class: 'btn-primary')

    # WAIT 5 SECONDS
    sleep 5

    # SAVE A SCREENSHOT OF THE NEW PAGE
    save_screenshot

    # EXPECT PAGE TO SHOW 1 ITEM IN THE CART
    expect(page).to have_text 'My Cart (1)'

  end

end
