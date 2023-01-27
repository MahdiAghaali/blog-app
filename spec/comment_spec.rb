require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.create(user_id: 3, post_id: 9, text: 'Hi Tom!') }
  before { subject.save }

  it 'post_id not to be string' do
    subject.post_id = 'alfa'
    expect(subject).to_not be_valid
  end

  it 'post_id not to be strings' do
    expect(subject.post_id).to_not be_nil
  end
end
