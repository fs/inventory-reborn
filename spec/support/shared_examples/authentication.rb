shared_examples 'a method that requires an authentication' do
  it 'responds unauthorized with an HTTP 401 status code' do
    send method, url
    expect(response.code).to eq '401'
  end
end
