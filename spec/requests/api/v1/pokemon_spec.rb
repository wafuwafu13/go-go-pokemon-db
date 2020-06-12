require 'rails_helper'

describe 'PokemonAPI' do
    let(:path) {'/api/v1/pokemons'}

    describe 'GET' do
        before do
            FactoryBot.create_list(:pokemon, 10)
            get path
            @json = JSON.parse(response.body)
        end

        it 'ステータスコード 200 を返す' do
            expect(response.status).to eq(200)
        end

        it '全てのポケモンを取得する' do
            expect(@json['data'].length).to eq(10)
        end
    end

    describe 'POST' do
        valid_params = { name: 'ポッチャマ', poke_id: 1 }

        it 'ポケモンが捕まえられている' do
            expect { post path, params: { pokemon: valid_params } }.to change(Pokemon, :count).by(+1)
            expect(response.status).to eq(200)
        end
    end

    describe 'DELETE' do
        before do
            @pokemon = FactoryBot.create(:pokemon)
        end

        it 'ポケモンを削除する' do
            expect { delete path + "/#{@pokemon.poke_id}" }.to change(Pokemon, :count).by(-1)
            expect(response.status).to eq(200)
        end
    end
end

