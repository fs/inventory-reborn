shared_examples 'a request with valid params' do |code|
  it 'returns http success' do
    expect(response).to be_success
    expect(response.code).to eq code
  end
end
