describe Api::BoardsController do
  let(:path) {}
  let(:params) { {} }
  let(:env) {}
  let!(:board) { create(:board) }

  context '正常系' do
    describe 'GET /boards' do
      let(:path) { api_boards_path }
      before { get_request }

      include_examples '200 OK'

      it 'ボード一覧を取得する', autodoc: true do
        is_asserted_by { json_data[0]['id'] == board.id }
      end
    end

    describe 'GET /board/:id' do
      let(:path) { api_boards_path(board.id) }
      before { get_request }

      include_examples '200 OK'

      it 'ボードを取得する', autodoc: true do
        is_asserted_by { json_data[0]['id'] == board.id }
      end
    end

    describe 'POST /boards' do
      let(:path) { api_boards_path }
      let(:params) { { title: 'title', text: 'text' } }
      before { post_request }

      include_examples '201 Created'

      it 'ボードを作成する', autodoc: true do
        new_board = Board.find(json_data['id'])
        is_asserted_by { new_board.present? }
        is_asserted_by { new_board.title == 'title' }
        is_asserted_by { new_board.text == 'text' }
      end
    end

    describe 'PUT /boards' do
      let(:path) { api_board_path(board.id) }
      let(:params) { { title: 'new_title', text: 'new_text' } }
      before { put_request }

      include_examples '200 OK'

      it 'ボードを更新する', autodoc: true do
        update_board = Board.find(board.id)
        is_asserted_by { json_data['id'] == board.id }
        is_asserted_by { json_data['title'] == 'new_title' }
        is_asserted_by { json_data['text'] == 'new_text' }

        is_asserted_by { update_board.id == json_data['id'] }
        is_asserted_by { update_board.title == 'new_title' }
        is_asserted_by { update_board.text == 'new_text' }
      end
    end

    describe 'DELETE /boards' do
      let(:path) { api_board_path(board.id) }
      before { delete_request }

      include_examples '204 No Content'

      it 'ボードを削除する', autodoc: true do
        delete_board = Board.find_by_id(board.id)
        is_asserted_by { delete_board.blank? }
      end
    end
  end
end
