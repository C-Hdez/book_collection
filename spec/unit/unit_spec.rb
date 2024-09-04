# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do 
    subject do
        described_class.new(title: 'Harry Potter')
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    it 'is not valid without a name' do
        subject.title = nil
        expect(subject).not_to be_valid
    end


    subject do
        described_class.new(title: 'Harry Potter', author: 'J. K. Rowling')
    end

    it 'is valid with an author' do
        expect(subject).to be_valid
    end

    
    subject do
        described_class.new(title: 'Harry Potter', price: 9.62)
    end

    it 'is valid with a price' do
        expect(subject).to be_valid
    end


    subject do
        described_class.new(title: 'Harry Potter', publish: 1997-06-26)
    end

    it 'is valid with a publish date' do
        expect(subject).to be_valid
    end

end
