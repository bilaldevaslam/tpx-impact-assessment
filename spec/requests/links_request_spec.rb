require 'rails_helper'
include Rails.application.routes.url_helpers

RSpec.describe 'Links', type: :request do
  # initialize test data
  let(:url) { 'https://www.google.com' }

  describe 'shorten url through encoding' do
    context 'with valid url and encoded string passed' do
      before { encode_link url, 'test' }

      it 'should encode the url with encoded string' do
        expect(response.body).to include('test')
      end

      it 'should return status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'with valid url and without encoded string' do
      before { encode_link url }

      it 'should return status code 200' do
        expect(response).to have_http_status(200)
        expect(Link.count).to eq(1)
      end
    end

    context 'with invalid url' do
      before { encode_link 'name' }

      it 'should return error' do
        expect(response).to have_http_status(422)
        expect(Link.count).to eq(0)
      end
    end
  end


  describe 'lenghten url through decoding' do
    context 'with valid url' do
      let!(:link) { create :link, encoded_string: 'test' }
      let(:encoded_url) { 'http://localhost:3000/test' }

      before { decode_link encoded_url }

      it 'should decode the url' do
        expect(response.body).to include(link.url)
      end

      it 'should return status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'with invalid url ' do
      before { decode_link 'https' }

      it 'should return not found' do
        expect(response).to have_http_status(404)
      end
    end
  end

  private

  def encode_link(url, encoded_string= '')
    post encode_api_v1_links_path, params: { url: url, encoded_string: encoded_string }
  end

  def decode_link(url)
    post decode_api_v1_links_path, params: { url: url }
  end
end