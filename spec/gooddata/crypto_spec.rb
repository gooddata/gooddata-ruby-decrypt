RSpec.describe Gooddata::Crypto do
  it "has a version number" do
    expect(Gooddata::Crypto::VERSION).not_to be nil
  end

  it "can encrypt string" do
    expect(Gooddata::Crypto.encrypt('Some secret string','supersecretencryptionkey').length).to be 66
  end

  it "can decrypt string encrypted by GoodData::Crypto" do
    expect(Gooddata::Crypto.decrypt("Vc+OmT3aA5BimjAt3alfFpz5wMSlVQHLwoFZLZ6FpeLcIZDEVHr9ET4Q55R0\nfm6W\n",'othersecretkey')).to eq('So glad it works')
  end
end

