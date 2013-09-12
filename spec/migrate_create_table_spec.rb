require 'rspec'
require_relative '../db/config'


describe "create table with correct schema" do
  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Migrator.current_version > 0
  end

  it "should have a Students table" do
    ActiveRecord::Base.connection.table_exists?(:students).should be_true
  end

  it "should have a Teachers table" do
    ActiveRecord::Base.connection.table_exists?(:teachers).should_be_true
  end

  it "should have the right columns and types" do
    expected_students = {
      :integer => ["id"],
      :string => ["first_name", "last_name", "gender", "email", "phone"],
      :date => ["birthday"],
      :datetime => ["created_at", "updated_at"]
    }

    ActiveRecord::Base.connection.columns(:students).each do |col|
      expected_students[col.type].include?(col.name).should be_true
    end

    expected_teachers = {
      :integer => ["id"],
      :string => ["first_name", "last_name", "email", "phone"],
      :datetime => ["created_at", "updated_at"]
    }

    ActiveRecord::Base.connection.columns(:teachers).each do |col|
      expected_teachers[col.type].include?(col.name).should_be_true
    end
  end
end
