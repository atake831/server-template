shared_examples_for '200 OK' do
  it '200 OK' do
    is_asserted_by { response.success? == true }
    is_asserted_by { response.status == 200 }
  end
end

shared_examples_for '201 Created' do
  it '201 Created' do
    is_asserted_by { response.success? == true }
    is_asserted_by { response.status == 201 }
  end
end

shared_examples_for '202 Accepted' do
  it '202 Accepted' do
    is_asserted_by { response.success? == true }
    is_asserted_by { response.status == 202 }
  end
end

shared_examples_for '204 No Content' do
  it '204 No Content' do
    is_asserted_by { response.success? == true }
    is_asserted_by { response.status == 204 }
  end
end

shared_examples_for '400 Bad Request' do
  it '400 Bad Request' do
    is_asserted_by { response.success? == false }
    is_asserted_by { response.status == 400 }
  end
end

shared_examples_for '401 Unauthorized' do
  it '401 Unauthorized' do
    is_asserted_by { response.success? == false }
    is_asserted_by { response.status == 401 }
  end
end

shared_examples_for '403 Forbidden' do
  it '403 Forbidden' do
    is_asserted_by { response.success? == false }
    is_asserted_by { response.status == 403 }
  end
end

shared_examples_for '404 Not Found' do
  it '404 Not Found' do
    is_asserted_by { response.success? == false }
    is_asserted_by { response.status == 404 }
  end
end
