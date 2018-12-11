require 'rails_helper'

RSpec.describe User, type: :model do
  user1 = User.new(id: 4, name: 'ABC', email: "abc007@example.com", password: "ksljdlajfskd", password_confirmation: "ksljdlajfskd")
  user2 = User.new(id: 7, name: 'DEFG', email: "defg22@example.com", password: "hjsakdjknn", password_confirmation: "hjsakdjknn")
  user3 = User.new(id: 11, name: 'HIJ', email: "hij12@example.com", password: "wuioeuenmn", password_confirmation: "wuioeuenmn")  
  user4 = User.new(id: 22, name: 'KLM', email: "klm33@example.com", password: "djkhfsdsdn", password_confirmation: "djkhfsdsdn")  
  user5 = User.new(id: 32, name: 'NOP', email: "nop2@example.com", password: "kmkjdjsklsd", password_confirmation: "kmkjdjsklsd")  
  user6 = User.new(id: 38, name: 'QRS', email: "qrs99@example.com", password: "llkkamsame", password_confirmation: "llkkamsame")  
  user7 = User.new(id: 41, name: 'TUV', email: "tuv78@example.com", password: "qieofmls", password_confirmation: "qieofmls")  
  user8 = User.new(id: 45, name: 'WXY', email: "wxy@example.com", password: "whjdksad", password_confirmation: "whjdksad")  
  user9 = User.new(id: 49, name: 'ZAB', email: "zab78@example.com", password: "ksfhdjskajfdn", password_confirmation: "ksfhdjskajfdn")  
  user10 = User.new(id: 51, name: 'DDE', email: "dde78@example.com", password: "hkjshasdhf", password_confirmation: "hkjshasdhf")  
  user11 = User.new(id: 55, name: 'FGH', email: "fgh78@example.com", password: "uyeryiuerw", password_confirmation: "uyeryiuerw")  
  user12 = User.new(id: 71, name: 'IJK', email: "ijk78@example.com", password: "jsjdnffs", password_confirmation: "jsjdnffs")  
  user13 = User.new(id: 82, name: 'LMN', email: "lmn78@example.com", password: "lmandodu", password_confirmation: "lmandodu")  

  describe ".create" do

    context "returns true when" do
      it "is a valid user" do
        expect(user1).to be_valid
      end
    end

    context "returns false when" do
      it "password is blank" do
        user2.password = nil
        expect(user2).to_not be_valid
        expect(user2.errors.full_messages).to include "Password can't be blank"
      end

      it "password confirmation is blank" do
        user3.password = nil
        user3.save
        expect(user3).to_not be_valid
        expect(user3.errors.full_messages).to include "Password digest can't be blank"
      end

      it "password and password confirmation don't match" do
        user4.password = "lkjsjdmnb"
        user4.save
        expect(user4).to_not be_valid
        expect(user4.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it "email isn't unique" do
        user1.save
        # The email below is the uppercase version of user1's email
        user5.email = "ABC007@example.com"
        user5.save
        expect(user5).to_not be_valid
        expect(user5.errors.full_messages).to include "Email has already been taken"
      end

      it "email is blank" do
        user6.email = nil
        user6.save
        expect(user6).to_not be_valid
        expect(user6.errors.full_messages).to include "Email can't be blank"        
      end

      it "name is blank" do
        user7.name = nil
        user7.save
        expect(user7).to_not be_valid
        expect(user7.errors.full_messages).to include "Name can't be blank"  
      end
      
      it "password is too short" do
      end
    end
  end
end
