require 'rails_helper'

RSpec.describe User, type: :model do
  user1 = User.new(id: 4, name: 'ABC', email: "abc007@example.com", password: "ksljdlajfskd", password_confirmation: "ksljdlajfskd")
  user2 = User.new(id: 7, name: 'DEFG', email: "defg22@example.com", password: "hjsakdjknn", password_confirmation: "hjsakdjknn")
  user3 = User.new(id: 11, name: 'HIJ', email: "hij12@example.com", password: "wuioeuenmn", password_confirmation: "wuioeuenmn")  
  user4 = User.new(id: 22, name: 'KLM', email: "klm33@example.com", password: "djkhfsdsdn", password_confirmation: "djkhfsdsdn")  
  user5 = User.new(id: 32, name: 'NOP', email: "nop2@example.com", password: "kmkjdjsklsd", password_confirmation: "kmkjdjsklsd")  
  user6 = User.new(id: 38, name: 'QRS', email: "qrs99@example.com", password: "llkkamsame", password_confirmation: "llkkamsame")  
  user7 = User.new(id: 41, name: 'TUV', email: "tuv78@example.com", password: "qieofmls", password_confirmation: "qieofmls")  

  describe ".create" do

    context "returns true when" do
      it "is a valid user" do
        expect(user1).to be_valid
      end
    end

    context "returns false when" do
      it "is an invalid password when it is blank" do
        user2.password = nil
        expect(user2).to_not be_valid
        expect(user2.errors.full_messages).to include "Password can't be blank"
      end

      it "is an invalid password confirmation when it is blank" do
        user3.password = nil
        user3.save
        expect(user3).to_not be_valid
        expect(user3.errors.full_messages).to include "Password digest can't be blank"
      end

      it "is invalid if the password and password confirmation don't match" do
        user4.password = "lkjsjdmnb"
        user4.save
        expect(user4).to_not be_valid
        expect(user4.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it "is an invalid email if it isn't unique" do
        user1.save
        # The email below is the uppercase version of user1's email
        user5.email = "ABC007@example.com"
        user5.save
        expect(user5).to_not be_valid
        expect(user5.errors.full_messages).to include "Email has already been taken"
      end

      it "is an invalid email if it is blank" do
        user6.email = nil
        user6.save
        expect(user6).to_not be_valid
        expect(user6.errors.full_messages).to include "Email can't be blank"        
      end

      it "is an invalid name if it is blank" do
        user7.name = nil
        user7.save
        expect(user7).to_not be_valid
        expect(user7.errors.full_messages).to include "Name can't be blank"  
      end
    end
  end



  describe '.authenticate_with_credentials' do
    it "is an invalid email if it is blank" do
      user8 = User.new(id: 45, name: 'WXY', email: "wxy@example.com", password: "whjdksad", password_confirmation: "whjdksad")  
      user9 = User.authenticate_with_credentials("", "whjdksad")
      expect(user9).to be nil
    end

    it "is an invalid password if it is blank" do
      user10 = User.new(id: 51, name: 'DDE', email: "dde78@example.com", password: "hkjshasdhf", password_confirmation: "hkjshasdhf")  
      user10.save
      user11 = User.authenticate_with_credentials("dde78@example.com", "")
      expect(user11).to be nil
    end

    it "is an invalid password if it has less than 8 characters" do
      user12 = User.new(id: 55, name: 'FGH', email: "fgh78@example.com", password: "jkdhsd", password_confirmation: "jkdhsd")  
      user12.save
      user13 = User.authenticate_with_credentials("fgh78@example.com", "jkdhsd")
      expect(user13).to be nil
    end

    it "is an invalid user if the email can't be found in the database" do
      user14 = User.new(id: 105, name: 'harry elwood', email: "hl22@example.com", password: "kjjdsklakjd", password_confirmation: "kjjdsklakjd")
      user14.save
      user15 = User.authenticate_with_credentials("hl22@example.com", "kjjdsklakjd")
      user16 = User.authenticate_with_credentials("doesnotexist@example.com", "kjjdsklakjd")
      expect(user15).to_not be nil
      expect(user16).to be nil
    end

    it "is an invalid password if is not associated with the entered email" do
      user15 = User.new(id: 111, name: 'ron moore', email: "rm31@example.com", password: "jhdhskjdfh", password_confirmation: "jhdhskjdfh")
      user15.save
      user16 = User.authenticate_with_credentials("rm31@example.com", "jhdhskjdfh")
      user17 = User.authenticate_with_credentials("rm31@example.com", "doesnotexist")
      expect(user16).to_not be nil
      expect(user17).to be nil
    end

    it "is a valid email even if it has white space before and after" do
      user18 = User.new(id: 117, name: 'brett favre', email: "bf97@example.com", password: "asdhjasnmdsb", password_confirmation: "asdhjasnmdsb")
      user18.save
      user19 = User.authenticate_with_credentials("      bf97@example.com     ", "asdhjasnmdsb")
      expect(user19).to_not be nil
    end

    it "has a valid email even if the casing is wrong" do
      user20 = User.new(id: 127, name: 'steve young', email: "sy77@example.com", password: "fvzxdgdfggd", password_confirmation: "fvzxdgdfggd")
      user20.save
      user21 = User.authenticate_with_credentials("SY77@EXAMPLE.COM", "fvzxdgdfggd")
      expect(user21).to_not be nil
    end
  end
end
