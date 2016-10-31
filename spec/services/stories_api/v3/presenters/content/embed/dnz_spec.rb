module StoriesApi
  module V3
    module Presenters
      module Content
        module Embed
          RSpec.describe Dnz do
            let(:record) {create(:record)}
            let(:block) {create(:embed_dnz_item, id: record.record_id)}
            let(:result) {subject.call(block)}

            it 'presents the fields under the :record field' do
              expect(result).to have_key(:record)
            end

            context 'record_id' do
              it 'includes it as a top level field' do
                expect(result).to have_key(:record_id)
              end

              it 'is an Integer' do
                expect(result[:record_id]).to be_an Integer
              end
            end

            it 'presents the record fields' do
              [:title, :display_collection, :category, :image_url, :tags].each do |key|
                expect(result[:record]).to have_key(key)
              end
            end

            it 'presents them from the correct record' do
              expect(result[:record][:title]).to eq(record.title)
            end
          end
        end
      end
    end
  end
end