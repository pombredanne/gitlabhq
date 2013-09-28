require 'spec_helper'

describe Gitlab::Auth do
  let(:gl_auth) { Gitlab::Auth.new }

  describe :find do
    before do
      @user = create(
        :user,
        username: 'john',
        password: '888777',
        password_confirmation: '888777'
      )
    end

    it "should find user by valid login/password" do
      gl_auth.find('john', '888777').should == @user
    end

    it "should not find user with invalid password" do
      gl_auth.find('john', 'invalid').should_not == @user
    end

    it "should not find user with invalid login and password" do
      gl_auth.find('jon', 'invalid').should_not == @user
    end
  end
end
